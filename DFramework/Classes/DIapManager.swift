//
//  DIapManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import StoreKit

public class DIapManager: NSObject {

    // MARK: Properties

    public var availableProducts: [SKProduct] = []

    private let productsRequest: SKProductsRequest
    private let allProductIds: [String]
    private var purchaseResult: ((Swift.Result<String, DIapError>) -> Void)?
    private var restoreResult: ((DIapError) -> Void)?

    init(allProductIds: [String]) {
        self.allProductIds = allProductIds
        self.productsRequest = SKProductsRequest(productIdentifiers: Set(allProductIds))

        super.init()

        productsRequest.delegate = self

        fetchAvailableProducts()
    }
}

// MARK: - Publics

public extension DIapManager {

    func fetchAvailableProducts() {
        productsRequest.start()
    }

    func purchase(productId: String, completion: @escaping(Swift.Result<String, DIapError>) -> Void) {
        guard let product = availableProducts.first(where: { $0.productIdentifier == productId }) else {
            completion(.failure(.productCouldNotFindInAvailableProducts))
            return
        }

        guard canMakePurchase else {
            completion(.failure(.canNotMakePurchase))
            return
        }

        self.purchaseResult = completion

        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(SKPayment(product: product))

        DLog.info("Purchase has been started for: \(productId)")
    }
}

// MARK: - SKProductsRequestDelegate

extension DIapManager: SKProductsRequestDelegate {

    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        availableProducts = response.products
    }
}

// MARK: - SKPaymentTransactionObserver

extension DIapManager: SKPaymentTransactionObserver {

    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let transaction = transactions.first else {
            return
        }

        switch transaction.transactionState {
        case .purchasing:
            DLog.info("Purchasing for the product: \(transaction.payment.productIdentifier)")

        case .purchased:
            SKPaymentQueue.default().finishTransaction(transaction)

            self.purchaseResult?(.success(transaction.payment.productIdentifier))

        case .failed:
            SKPaymentQueue.default().finishTransaction(transaction)

            self.purchaseResult?(.failure(.paymentFailed))

        case .restored:
            SKPaymentQueue.default().finishTransaction(transaction)

        case .deferred:
            break

        default:
            break
        }
    }

    public func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {}

    public func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        DLog.error(error.localizedDescription)

        self.restoreResult?(.restoreFailed)
    }
}

// MARK: - Privates

private extension DIapManager {

    var canMakePurchase: Bool {
        SKPaymentQueue.canMakePayments()
    }
}

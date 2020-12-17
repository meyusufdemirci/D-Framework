//
//  DIapManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import StoreKit

public class DIapManager: NSObject {

    // MARK: Properties

    public static let shared = DIapManager()

    public var purchaseResult: ((Swift.Result<SKProduct?, DIapError>) -> Void)?
    public var restoreResult: ((Swift.Result<SKProduct?, DIapError>) -> Void)?

    public private(set) var availableProducts: [SKProduct] = []

    private var productsRequest: SKProductsRequest?
    private var allProductIds: [String] = []

    public override init() {}
}

// MARK: - Publics

public extension DIapManager {

    func setProductIds(_ ids: [String]) {
        allProductIds = ids

        productsRequest = SKProductsRequest(productIdentifiers: Set(allProductIds))
        productsRequest?.delegate = self

        fetchAvailableProducts()
    }

    func purchase(productId: String) {
        guard let product = availableProducts.first(where: { $0.productIdentifier == productId }) else {
            purchaseResult?(.failure(.productCouldNotFindInAvailableProducts))
            return
        }

        guard canMakePurchase else {
            purchaseResult?(.failure(.canNotMakePurchase))
            return
        }

        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(SKPayment(product: product))

        DLog.info("Purchase has been started for: \(productId)")
    }

    func restorePurchase() {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

// MARK: - SKProductsRequestDelegate

extension DIapManager: SKProductsRequestDelegate {

    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        availableProducts = response.products
    }
}

// MARK: - SKRequestDelegate

extension DIapManager: SKRequestDelegate {

    public func request(_ request: SKRequest, didFailWithError error: Error) {
        DLog.error(error.localizedDescription)
    }
}

// MARK: - SKPaymentTransactionObserver

extension DIapManager: SKPaymentTransactionObserver {

    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        guard let transaction = transactions.first else { return }

        switch transaction.transactionState {
        case .purchasing:
            DLog.info("Purchasing for the product: \(transaction.payment.productIdentifier)")

        case .purchased:
            SKPaymentQueue.default().finishTransaction(transaction)

            let product = availableProductByProductId(transaction.payment.productIdentifier)

            self.purchaseResult?(.success(product))

        case .failed:
            SKPaymentQueue.default().finishTransaction(transaction)

            self.purchaseResult?(.failure(.paymentFailed))

        case .restored:
            SKPaymentQueue.default().finishTransaction(transaction)

            let product = availableProductByProductId(transaction.payment.productIdentifier)

            self.restoreResult?(.success(product))

        case .deferred:
            break

        default:
            break
        }
    }

    public func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {}

    public func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        DLog.error(error.localizedDescription)

        self.restoreResult?(.failure(.restoreFailed))
    }
}

// MARK: - Privates

private extension DIapManager {

    var canMakePurchase: Bool {
        SKPaymentQueue.canMakePayments()
    }
}

// MARK: - Privates

private extension DIapManager {

    func fetchAvailableProducts() {
        productsRequest?.start()
    }

    func availableProductByProductId(_ id: String) -> SKProduct? {
        availableProducts.first { $0.productIdentifier == id }
    }
}

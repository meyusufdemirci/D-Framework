//
//  DAppManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import StoreKit
import UIKit

public class DAppManager {}

// MARK: - Publics

public extension DAppManager {

    class func showAppSettings() {
        guard let appSettingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(appSettingsURL) {
                UIApplication.shared.open(appSettingsURL)
            }
        }
    }

    class func showStorePage(appId: Int) {
        let parameters = [SKStoreProductParameterITunesItemIdentifier: appId]

        let storeViewController = SKStoreProductViewController()

        storeViewController.loadProduct(withParameters: parameters) { success, error in
            guard success else {
                DLog.error(error?.localizedDescription ?? "")
                return
            }

            (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .windows.first?
                .rootViewController?
                .present(storeViewController, animated: true)
        }

        // Old way
//        guard let storeUrl = URL(string: "itms-apps://itunes.apple.com/app/id\(appId)") else { return }
//        DispatchQueue.main.async {
//            if UIApplication.shared.canOpenURL(storeUrl) {
//                UIApplication.shared.open(storeUrl)
//            }
//        }
    }

    class func showRateUs() {
        guard let activeScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

        // TODO: Use appStoreOverlay in StoreKit
        SKStoreReviewController.requestReview(in: activeScene)
    }
}

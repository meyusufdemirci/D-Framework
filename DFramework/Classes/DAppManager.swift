//
//  DAppManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

#if os(iOS)
import UIKit
#else
import Foundation
#endif

public class DAppManager {}

// MARK: - Publics

public extension DAppManager {

    #if os(iOS)
    class func showAppSettings() {
        guard let appSettingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(appSettingsURL) {
                UIApplication.shared.open(appSettingsURL)
            }
        }
    }

    class func showStorePage(appId: Int) {
        guard let storeUrl = URL(string: "itms-apps://itunes.apple.com/app/id\(appId)") else { return }
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(storeUrl) {
                UIApplication.shared.open(storeUrl)
            }
        }
    }
    #endif
}

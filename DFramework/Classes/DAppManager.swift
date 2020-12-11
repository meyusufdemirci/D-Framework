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
        guard let appSettingsURL = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(appSettingsURL) else { return }
        UIApplication.shared.open(appSettingsURL)
    }

    class func showStorePage(appId: Int) {
        guard let storeUrl = URL(string: "itms-apps://itunes.apple.com/app/id\(appId)"),
              UIApplication.shared.canOpenURL(storeUrl) else { return }
        UIApplication.shared.open(storeUrl)
    }
    #endif
}

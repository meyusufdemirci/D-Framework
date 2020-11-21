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
    #endif
}

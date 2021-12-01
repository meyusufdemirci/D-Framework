//
//  DNavigationManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 09.12.20.
//

import SwiftUI

public class DNavigationManager {}

// MARK: - Public Functions
public extension DNavigationManager {

    class func setRootView<T: View>(window: UIWindow, view: T) {
        window.rootViewController = UIHostingController(rootView: view)
        window.makeKeyAndVisible()
    }
}

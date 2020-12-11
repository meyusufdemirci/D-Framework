//
//  DNavigationManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 09.12.20.
//

#if os(iOS)
import SwiftUI
#else
import Foundation
#endif

public class DNavigationManager {}

// MARK: - Public Functions
public extension DNavigationManager {

    #if os(iOS)
    class func setRootView<T: View>(window: UIWindow, view: T) {
        window.rootViewController = UIHostingController(rootView: view)
        window.makeKeyAndVisible()
    }
    #endif
}


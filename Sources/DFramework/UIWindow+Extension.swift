//
//  UIWindow+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 1.12.2021.
//

import UIKit

public extension UIWindow {

    static var activeWindow: UIWindow? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
    }
}

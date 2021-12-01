//
//  UIApplication+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 1.12.2021.
//

import UIKit

public extension UIApplication {

    var safeAreaTop: CGFloat {
        UIWindow.activeWindow?.safeAreaInsets.top ?? 0
    }

    var safeAreaBottom: CGFloat {
        UIWindow.activeWindow?.safeAreaInsets.bottom ?? 0
    }
}

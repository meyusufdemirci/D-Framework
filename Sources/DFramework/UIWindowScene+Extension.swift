//
//  UIWindowScene+Extension.swift
//  
//
//  Created by Yusuf Demirci on 23.01.2022.
//

import UIKit

public extension UIWindowScene {

    static var activeWindowScene: UIWindowScene? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)
    }
}

//
//  UIColor+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import SwiftUI

public extension UIColor {

    static var systemWhite: UIColor {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .light ? .white : .black
        }
    }
    static var systemBlack: UIColor {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .light ? .black : .white
        }
    }

    func toColor() -> Color {
        Color(self)
    }
}

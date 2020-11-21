//
//  UIColor+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import SwiftUI

#if os(iOS)
public extension UIColor {

    func toColor() -> Color {
        Color(self)
    }
}
#endif

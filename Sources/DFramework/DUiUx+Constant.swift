//
//  DUiUx+Constant.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import UIKit

public extension DConstant {

    class UiUx {

        public static let cornerRadius: CGFloat = 8
        public static let shadowColor: CGColor = UIColor.black.cgColor
        public static let shadowOpacity: Float = 0.05
        public static let margin: Int = 16
        public static let textFieldHeight: Int = 44

        public static let tapLongPressGestureTransform: CGAffineTransform = .init(scaleX: 0.85, y: 0.85)

        public static let animationDuration: TimeInterval = 0.15
    }
}

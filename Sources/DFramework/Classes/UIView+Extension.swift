//
//  UIView+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import UIKit

public extension UIView {

    func roundedCorner(radius: CGFloat? = nil) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius ?? (min(self.frame.width, self.frame.height) / 2)
    }
}

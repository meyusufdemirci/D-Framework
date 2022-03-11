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

    func blur(effect: UIBlurEffect.Style = .dark, opacity: CGFloat = 0.7) {
        let effect: UIBlurEffect = .init(style: effect)
        let effectView: UIVisualEffectView = .init(effect: effect)
        effectView.alpha = opacity
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(effectView)
    }
}

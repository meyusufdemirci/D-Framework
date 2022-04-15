//
//  File.swift
//  
//
//  Created by Yusuf Demirci on 9.04.2022.
//

import UIKit

public extension UIStackView {

    func totalWidth(oneItemWidth: CGFloat) -> CGFloat {
        (CGFloat(self.arrangedSubviews.count) * oneItemWidth) + (CGFloat(self.arrangedSubviews.count - 1) * self.spacing)
    }
}

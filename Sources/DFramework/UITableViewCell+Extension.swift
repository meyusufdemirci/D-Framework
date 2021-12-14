//
//  UITableViewCell+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import UIKit

public extension UITableViewCell {

    static var identifier: String {
        String(describing: self.self)
    }
}

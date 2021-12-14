//
//  UITableView+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import UIKit

public extension UITableView {

    func register(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

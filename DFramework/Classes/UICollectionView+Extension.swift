//
//  UICollectionView+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import UIKit

public extension UICollectionView {

    func register(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

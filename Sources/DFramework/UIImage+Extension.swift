//
//  UIImage+Extension.swift
//  
//
//  Created by Yusuf Demirci on 23.01.2022.
//

import UIKit

public extension UIImage {

    func compress(quality: DImageQuality) -> UIImage? {
        guard let data = jpegData(compressionQuality: quality.rawValue) else { return nil }
        return .init(data: data)
    }

    func sizeAsByte() -> Int {
        self.pngData()?.sizeAsByte() ?? 0
    }

    func sizeAsMb() -> Double {
        self.pngData()?.sizeAsMb() ?? 0
    }

    func orientation() -> DImageOrientation {
        if size.width > size.height {
            return .landscape
        } else if size.height > size.width {
            return .portrait
        }
        return .square
    }
}

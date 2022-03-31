//
//  UIImage+Extension.swift
//  
//
//  Created by Yusuf Demirci on 23.01.2022.
//

import UIKit

public extension UIImage {

    func compress(quality: CGFloat) -> UIImage? {
        guard let data = self.jpegData(compressionQuality: quality) else { return nil }
        return .init(data: data)
    }

    func compress(quality: CGFloat) -> Data? {
        self.jpegData(compressionQuality: quality)
    }

    func compress(quality: DImageQuality) -> UIImage? {
        guard let data = self.jpegData(compressionQuality: quality.rawValue) else { return nil }
        return .init(data: data)
    }

    func compress(quality: DImageQuality) -> Data? {
        self.jpegData(compressionQuality: quality.rawValue)
    }

    func sizeAsByte() -> Double {
        self.pngData()?.sizeAsByte() ?? 0
    }

    func sizeAsKb() -> Double {
        self.pngData()?.sizeAsKb() ?? 0
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

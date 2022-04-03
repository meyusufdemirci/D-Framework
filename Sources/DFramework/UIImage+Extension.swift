//
//  UIImage+Extension.swift
//  
//
//  Created by Yusuf Demirci on 23.01.2022.
//

import UIKit

public extension UIImage {

    func sizeAsByte() -> Double {
        self.pngData()?.sizeAsByte() ?? 0
    }

    func sizeAsKb() -> Double {
        self.pngData()?.sizeAsKb() ?? 0
    }

    func sizeAsMb() -> Double {
        self.pngData()?.sizeAsMb() ?? 0
    }

    func compress(quality: CGFloat) -> UIImage? {
        guard let data: Data = self.jpegData(compressionQuality: quality) else { return nil }
        return .init(data: data)
    }

    func compress(quality: CGFloat) -> Data? {
        self.jpegData(compressionQuality: quality)
    }

    func compress(quality: DImageQuality) -> UIImage? {
        guard let data: Data = self.jpegData(compressionQuality: quality.rawValue) else { return nil }
        return .init(data: data)
    }

    func compress(quality: DImageQuality) -> Data? {
        self.jpegData(compressionQuality: quality.rawValue)
    }

    func compress(maxKb: Double) -> UIImage? {
        guard let data: Data = self.compress(maxKb: maxKb) else { return nil }
        return .init(data: data)
    }

    func compress(maxKb: Double) -> Data? {
        var data: Data? = self.compress(quality: .highest)
        var quality: CGFloat = 1

        while data?.sizeAsKb() ?? 0 > maxKb {
            data = self.compress(quality: quality)
            quality -= 0.1
        }

        return data
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

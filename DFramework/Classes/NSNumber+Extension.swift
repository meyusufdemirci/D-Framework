//
//  NSNumber+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public extension NSNumber {

    func ratio(_ ratio: Double) -> NSNumber {
        NSNumber(value: self.doubleValue * ratio)
    }
}

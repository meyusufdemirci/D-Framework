//
//  Double+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public extension Double {

    /// Removes decimal zero
    ///  - Returns: 5.0 --> 5
    var removeUnnecessaryZero: String {
        self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

    /// Cleans decimal numbers
    ///
    /// - Parameter decimalCount: the number count after dot
    /// - Returns: 3.14159 --> 3
    func cleanDecimal(decimalCount: Int = 0) -> Double {
        Double(String(format: "%.\(decimalCount)f", self)) ?? self
    }
}

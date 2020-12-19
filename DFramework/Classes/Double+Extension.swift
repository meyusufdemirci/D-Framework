//
//  Double+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public extension Double {

    /// Cleans decimal numbers
    ///
    /// - Parameter decimalCount: the number count after dot
    /// - Returns: 3.14159 --> 3
    func cleanDecimal(decimalCount: Int = 0) -> Double {
        Double(String(format: "%.\(decimalCount)f", self)) ?? self
    }
}

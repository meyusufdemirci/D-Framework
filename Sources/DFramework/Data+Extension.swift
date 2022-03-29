//
//  Data+Extension.swift
//  
//
//  Created by Yusuf Demirci on 11.03.2022.
//

import Foundation

public extension Data {

    func sizeAsByte() -> Int {
        self.count
    }

    func sizeAsMb() -> Double {
        Double(self.sizeAsByte()) / pow(1024, 2)
    }
}

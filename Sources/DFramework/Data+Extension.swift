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

    func sizeAsKb() -> Double {
        Double(self.sizeAsByte()) / 1024
    }

    func sizeAsMb() -> Double {
        Double(self.sizeAsKb()) / 1024
    }
}

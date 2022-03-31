//
//  Data+Extension.swift
//  
//
//  Created by Yusuf Demirci on 11.03.2022.
//

import Foundation

public extension Data {

    func sizeAsByte() -> Double {
        .init(self.count)
    }

    func sizeAsKb() -> Double {
        self.sizeAsByte() / 1024
    }

    func sizeAsMb() -> Double {
        self.sizeAsKb() / 1024
    }
}

//
//  Dictionary+Extension.swift
//  
//
//  Created by Yusuf Demirci on 8.04.2022.
//

import Foundation

public extension Dictionary where Key == String, Value == Any {

    mutating func addValueSafely(key: String, value: Any?) {
        guard let value = value else { return }
        self[key] = value
    }
}

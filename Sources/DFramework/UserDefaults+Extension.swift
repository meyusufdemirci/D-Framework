//
//  UserDefaults+Extension.swift
//  
//
//  Created by Yusuf Demirci on 23.01.2022.
//

import Foundation

public extension UserDefaults {

    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            setValue(newValue, forKey: key)
        }
    }
}

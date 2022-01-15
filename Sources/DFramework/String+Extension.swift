//
//  String+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import Foundation

public extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func localizeSafely(safe: String) -> String {
        let localizedValue = self.localized
        return localizedValue == self ? safe : localizedValue
    }
}

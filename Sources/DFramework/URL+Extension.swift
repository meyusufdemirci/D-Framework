//
//  URL+Extension.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import Foundation

public extension URL {

    var sanitise: URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return self }
        if components.scheme == nil {
            components.scheme = "http"
        }
        return components.url ?? self
    }
}

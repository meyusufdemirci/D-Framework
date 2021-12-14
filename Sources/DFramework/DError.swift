//
//  DError.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public enum DError: Error {
    case general

    public var localizedDescription: String {
        switch self {
        case .general:
            return ""
//            return Localized.DError.general
        }
    }
}

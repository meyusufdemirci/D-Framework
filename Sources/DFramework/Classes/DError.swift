//
//  DError.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public enum DError: Error {
    case general

    public var localizedDescription: String {
        switch self {
        case .general:
            return Localized.DError.general
        }
    }
}

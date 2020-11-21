//
//  DLanguage.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public enum DLanguage: String {
    case english = "en"
    case turkish = "tr"

    public var name: String {
        switch self {
        case .english:
            return "English"
        case .turkish:
            return "Türkçe"
        }
    }
}

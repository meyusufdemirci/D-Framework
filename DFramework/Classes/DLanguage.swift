//
//  DLanguage.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public enum DLanguage: String {
    case english = "en"
    case turkish = "tr"
    case german = "de"
    case spanish = "es"
    case french = "fr"
    case italian = "it"

    public var name: String {
        switch self {
        case .english:
            return "English"
        case .turkish:
            return "Türkçe"
        case .german:
            return "Deutsche"
        case .spanish:
            return "Español"
        case .french:
            return "Français"
        case .italian:
            return "Italiano"
        }
    }
}

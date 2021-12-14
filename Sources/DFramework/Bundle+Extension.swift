//
//  Bundle+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public extension Bundle {

    var versionNo: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildNo: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}

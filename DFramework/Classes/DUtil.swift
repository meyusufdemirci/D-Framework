//
//  DUtil.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public class DUtil {}

// MARK: - Publics

public extension DUtil {

    class func isForceUpdateRequired(appVersion: String, minVersion: String) -> Bool {
        let minVersions = minVersion.components(separatedBy: ".")
        let appVersions = appVersion.components(separatedBy: ".")

        if appVersions[0] < minVersions[0] {
            return true
        } else if appVersions[0] >= minVersions[0], appVersions[1] < minVersions[1] {
            return true
        } else if appVersions[0] >= minVersions[0], appVersions[1] >= minVersions[1], appVersions[2] < minVersions[2] {
            return true
        }

        return false
    }
}

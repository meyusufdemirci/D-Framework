//
//  DUtil.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public class DUtil {}

// MARK: - Publics

public extension DUtil {

    /// Returns random number between min and max
    /// - Parameters:
    ///   - min: The min value you want it return
    ///   - max: The max value you want it return
    /// - Returns: min = 0, max = 5, the return must be one of them --> [0, 1, 2, 3, 4, 5]
    class func randomNumber(min: Int, max: Int) -> Int {
        Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
    }

    /// Returns random alphanumeeric string with given length
    /// - Parameter length: The count of the string chars
    class func randomString(length: Int) -> String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0 ..< length).map { _ in letters.randomElement()! })
    }

    /// Returns whether force update required
    /// - Parameters:
    ///   - appVersion: The version number of the main app, which means Bundle.main.versionNo
    ///   - minVersion: The min version that you want to support
    /// - Returns: appVersion = "1.3.6", minVersion = "1.4.0", the return must be --> true
    class func isForceUpdateRequired(appVersion: String = Bundle.main.versionNo!, minVersion: String) -> Bool {
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

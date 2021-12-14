//
//  DLogManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

private enum LogType: String {
    case error = "[‼️]"
    case info = "[ℹ️]"
    case debug = "[💬]"
    case verbose = "[🔬]"
    case warning = "[⚠️]"
    case severe = "[🔥]"
}

public class DLog {

    // MARK: Properties

    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    private static let logPrefix: String = "DSLogManager:"
    private static let dateFormat: String = "hh:mm:ss"
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Publics

public extension DLog {

    class func error(_ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.error.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)
                """
            )
        }
    }

    class func info(_ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.info.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)
                """
            )
        }
    }

    class func debug(_ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.debug.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)
                """
            )
        }
    }

    class func verbose(_ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.verbose.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)
                """
            )
        }
    }

    class func warning(_ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.warning.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object!)
                """
            )
        }
    }

    class func severe(_ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print(
                """
                \(logPrefix) \(Date().toString()) \(LogType.severe.rawValue)
                [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)
                """
            )
        }
    }

    class func custom(_ log: String) {
        guard isLoggingEnabled else { return }

        print("\(logPrefix) [\(Date().toString())] \(log)")
    }
}

// MARK: - Privates

private extension DLog {

    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {

    func toString() -> String {
        DLog.dateFormatter.string(from: self as Date)
    }
}

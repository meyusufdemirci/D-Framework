//
//  DDate.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public struct DDate {

    // MARK: Properties

    public let date: Date
    public let formatter: DateFormatter

    public var dateSeparator: String = DConstant.Date.dateSeparator
    public var timeSeparator: String = DConstant.Date.timeSeparator

    public init(date: Date = Date(), formatter: DateFormatter = .init()) {
        self.date = date
        self.formatter = formatter
    }

    public init(date: String, format: String, formatter: DateFormatter = .init()) {
        self.formatter = formatter
        formatter.dateFormat = format
        self.date = formatter.date(from: date)!
    }
}

// MARK: - Publics

public extension DDate {

    func custom(dateFormat: String) -> String {
        formatter.dateFormat = dateFormat
        return toString()
    }

    func raw() -> String {
        formatter.dateFormat = "dd\(dateSeparator)MM\(dateSeparator)yyyy HH\(timeSeparator)mm\(timeSeparator)ss zzz"
        return toString()
    }

    func userFriendly() -> String {
        formatter.dateFormat = "dd\(dateSeparator)MM\(dateSeparator)yyyy HH\(timeSeparator)mm"
        return toString()
    }

    func toString() -> String {
        formatter.string(from: date)
    }
}

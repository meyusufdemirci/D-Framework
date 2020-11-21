//
//  DDate.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public struct DSDate {

    // MARK: Properties

    public var date: Date
    public var dateSeparator: String = DConstant.Date.dateSeparator
    public var timeSeparator: String = DConstant.Date.timeSeparator
    private let formatter = DateFormatter()

    public init(date: Date = Date()) {
        self.date = date
    }

    public init(date: String, format: String) {
        self.date = formatter.date(from: format)!
    }
}

// MARK: - Publics

public extension DSDate {

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
}

// MARK: - Privates

private extension DSDate {

    func toString() -> String {
        formatter.string(from: date)
    }
}

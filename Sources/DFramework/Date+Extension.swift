//
//  Date+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public extension Date {

    var day: Int {
        Calendar.current.component(Calendar.Component.day, from: self)
    }

    var month: Int {
        Calendar.current.component(Calendar.Component.month, from: self)
    }

    var year: Int {
        Calendar.current.component(Calendar.Component.year, from: self)
    }

    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?, milliseconds: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second
        let milliseconds = Int(recent.timeIntervalSince(previous) * 1000)

        return (month: month, day: day, hour: hour, minute: minute, second: second, milliseconds: milliseconds)
    }

    func totalDistance(to date: Date, resultIn component: Calendar.Component) -> Int? {
        Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }
}

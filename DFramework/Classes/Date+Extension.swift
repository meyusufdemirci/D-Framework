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

    func totalDistance(to date: Date, resultIn component: Calendar.Component) -> Int? {
        Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }
}

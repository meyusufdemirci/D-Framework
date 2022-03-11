//
//  Array+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.12.20.
//

import Foundation

public extension Array {

    func random() -> (element: Element, index: Int) {
        let randomNumber = DUtil.randomNumber(min: 0, max: self.count - 1)
        return (element: self[randomNumber], index: randomNumber)
    }
}

public extension Array where Element == String {

    func exactContains(_ string: String) -> Bool {
        self.map { $0.lowercased() == string.lowercased() }.contains(true)
    }
}

public extension Array where Element: Equatable {

    mutating func remove(_ element: Element) {
        if let index = self.firstIndex(where: { $0 == element }) {
            self.remove(at: index)
        }
    }
}

public extension Array where Element: Hashable {

    func remove(_ element: Element) -> Array {
        self.filter { $0 != element }
    }
}

public extension Array where Element: Identifiable {

    func index(_ element: Element) -> Int? {
        self.firstIndex(where: { $0.id == element.id })
    }

    mutating func replace(_ newElement: Element) {
        if let index = self.firstIndex(where: { $0.id == newElement.id }) {
            self[index] = newElement
        }
    }

    mutating func remove(_ newElement: Element) {
        if let index = self.firstIndex(where: { $0.id == newElement.id }) {
            self.remove(at: index)
        }
    }
}

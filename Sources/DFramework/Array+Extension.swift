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

public extension Array where Element: Identifiable {

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

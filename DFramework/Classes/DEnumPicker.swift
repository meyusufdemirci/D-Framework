//
//  DEnumPicker.swift
//  DFramework
//
//  Created by Yusuf Demirci on 04.12.20.
//

import SwiftUI

// MARK: - DEnumPickerDisplayable

public protocol DEnumPickerDisplayable {
    var displayValue: String { get }
}

public struct DEnumPicker<T: Hashable & CaseIterable, V: View>: View {

    // MARK: Properties

    @Binding public var selected: T

    public var title: String?

    private let mapping: (T) -> V

    public var body: some View {
        Picker(selection: $selected, label: Text(title ?? "")) {
            ForEach(Array(T.allCases), id: \.self) {
                mapping($0).tag($0)
            }
        }
    }
}

public extension DEnumPicker where T: DEnumPickerDisplayable, V == Text {

    init(selected: Binding<T>, title: String? = nil) {
        self.init(selected: selected, title: title) {
            Text($0.displayValue)
        }
    }
}

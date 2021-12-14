//
//  NavigationLink+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 15.12.20.
//

import SwiftUI

public extension NavigationLink where Label == EmptyView {

    init?<V: Identifiable>(item: Binding<V?>, destination: @escaping (V) -> Destination) {
        guard let value = item.wrappedValue else { return nil }

        let isActive: Binding<Bool> = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                // There's shouldn't be a way for SwiftUI to set `true` here.
                if !value {
                    item.wrappedValue = nil
                }
            }
        )

        self.init(destination: destination(value), isActive: isActive, label: { EmptyView() })
    }
}

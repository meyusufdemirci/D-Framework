//
//  View+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import SwiftUI

public extension View {

    // USAGE
//    struct MyApp: App {
//        enum Sheet { case first, second }
//
//        @State var sheet: Sheet? = nil
//
//        var body: some Scene {
//            WindowGroup {
//                VStack {
//                    Button("First") { sheet = .first }
//                    Button("Second") { sheet = .second }
//                }
//                .sheet(using: $sheet) { sheet in
//                    switch sheet {
//                    case .first:
//                        FirstView()
//                    case .second:
//                        SecondView()
//                    }
//                }
//            }
//        }
//    }
    func sheet<Content: View, Value>(using value: Binding<Value?>,
                                     @ViewBuilder content: @escaping (Value) -> Content) -> some View {
        let binding = Binding<Bool>(
            get: { value.wrappedValue != nil },
            set: { _ in value.wrappedValue = nil }
        )

        return sheet(isPresented: binding) {
            content(value.wrappedValue!)
        }
    }
}

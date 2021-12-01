//
//  DAdaptKeyboardByInputModifier.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Combine
import SwiftUI

// To align keyboard by input view such as textfield
public struct DAdaptKeyboardByInputModifier: ViewModifier {

    // MARK: Properties

    @State private var currentHeight: CGFloat = 0

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.currentHeight)
                .animation(.easeOut(duration: 0.16))
                .onAppear { self.onAppear(geometry: geometry) }
        }
    }
}

private extension DAdaptKeyboardByInputModifier {

    func onAppear(geometry: GeometryProxy) {
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillShowNotification
        )
        .merge(
            with: NotificationCenter.Publisher(center: NotificationCenter.default,
                                               name: UIResponder.keyboardWillChangeFrameNotification)
        )
        .compactMap { notification in
            notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        }
        .map { rect in
            rect.height - geometry.safeAreaInsets.bottom
        }
        .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))

        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillHideNotification
        )
        .compactMap { _ in .zero }
        .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
    }
}

public extension View {

    func dAdaptKeyboardByInputModifier() -> some View {
        modifier(DAdaptKeyboardByInputModifier())
    }
}

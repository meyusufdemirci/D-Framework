//
//  DDismissKeyboardModifier.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

#if os(iOS)
import SwiftUI

// To dismiss keyboard when tapped around
public struct DDismissKeyboardModifier: ViewModifier {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .map({ $0 as? UIWindowScene })
                    .compactMap({ $0 })
                    .first?.windows
                    .filter({ $0.isKeyWindow }).first
                keyWindow?.endEditing(true)
            }
    }
}

public extension View {

    func dDismissKeyboardModifier() -> some View {
        modifier(DDismissKeyboardModifier())
    }
}
#endif

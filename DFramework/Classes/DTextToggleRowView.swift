//
//  DTextToggleRowView.swift
//  DFramework
//
//  Created by Yusuf Demirci on 03.12.20.
//

import SwiftUI

public struct DTextToggleRowView: View {

    // MARK: Properties

    public let text: String
    @Binding public var isToggleOn: Bool

    public init(text: String, isToggleOn: Binding<Bool>) {
        self.text = text
        self._isToggleOn = isToggleOn
    }

    public var body: some View {
        Toggle(text, isOn: $isToggleOn)
    }
}

struct DTextToggleRowView_Previews: PreviewProvider {

    static var previews: some View {
        DTextToggleRowView(text: "text", isToggleOn: .constant(true))
    }
}

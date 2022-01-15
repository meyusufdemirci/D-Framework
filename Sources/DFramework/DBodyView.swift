//
//  DBodyView.swift
//  
//
//  Created by Yusuf Demirci on 15.01.2022.
//

import SwiftUI

public struct DBodyView<Content: View>: View {

    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
    }
}

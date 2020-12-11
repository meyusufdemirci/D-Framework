//
//  DTextRowView.swift
//  DFramework
//
//  Created by Yusuf Demirci on 03.12.20.
//

import SwiftUI

public struct DTextRowView: View {

    // MARK: Properties

    public let text: String

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
    }
}

struct DTextRowView_Previews: PreviewProvider {

    static var previews: some View {
        DTextRowView(text: "text")
    }
}

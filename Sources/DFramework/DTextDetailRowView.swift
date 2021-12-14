//
//  DTextDetailRowView.swift
//  DFramework
//
//  Created by Yusuf Demirci on 15.12.20.
//

import SwiftUI

public struct DTextDetailRowView: View {

    // MARK: Properties

    public let text: String
    public let detail: String

    public init(text: String, detail: String) {
        self.text = text
        self.detail = detail
    }

    public var body: some View {
        HStack {
            Text(text)

            Spacer()

            Text(detail)
                .foregroundColor(UIColor.systemGray.toColor())
        }
        .contentShape(Rectangle())
    }
}

struct DTextDetailRowView_Previews: PreviewProvider {

    static var previews: some View {
        DTextDetailRowView(text: "text", detail: "detail")
    }
}

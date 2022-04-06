//
//  DSheetContainer.swift
//  
//
//  Created by Yusuf Demirci on 2.04.2022.
//

import SwiftUI

public struct DSheetContainer: Identifiable {

    public let id = UUID()
    public let sheet: AnyView

    public init(sheet: AnyView) {
        self.sheet = sheet
    }
}

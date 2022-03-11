//
//  File.swift
//  
//
//  Created by Yusuf Demirci on 3.03.2022.
//

import SwiftUI

public extension Text {

    func sizeToFit(minScaleFactor: CGFloat = 0.5) -> some View {
        self.minimumScaleFactor(minScaleFactor)
    }
}

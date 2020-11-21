//
//  DView.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import SwiftUI

public protocol DView: View {

    func onAppear()
}

public extension DView {

    func onAppear() {}
}

//
//  DUIView.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import UIKit

open class DUIView: UIView {

    public init() {
        super.init(frame: .zero)

        setup()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setup() {}

    open func update() {}
}

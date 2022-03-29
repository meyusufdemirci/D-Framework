//
//  DLoadingView.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import UIKit

public class DLoadingView: DUIView {

    // MARK: Properties

    private let maskView_: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .label.withAlphaComponent(DUI.transparentAlpha1)
        return view
    }()
    public let indicatorView: UIActivityIndicatorView = {
        let view: UIActivityIndicatorView = .init(style: .large)
        view.color = .systemWhite
        return view
    }()

    public override func setup() {
        super.setup()

        self.addSubview(maskView_)
        maskView_.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(UIScreen.main.bounds.width / 5)
        }
    }
}

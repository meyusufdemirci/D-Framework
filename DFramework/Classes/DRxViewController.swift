//
//  DRxViewController.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import RxCocoa
import RxSwift
import UIKit

open class DRxViewController: UIViewController {

    // MARK: Properties

    public var hidesBackButtonTitle: Bool = true

    public let disposeBag: DisposeBag = .init()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        bind()
    }

    open func setup() {
        if hidesBackButtonTitle {
            let backButton = UIBarButtonItem()
            backButton.title = ""
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }

        self.view.backgroundColor = .systemGroupedBackground
    }

    open func bind() {}
}

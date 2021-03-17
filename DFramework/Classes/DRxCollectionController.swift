//
//  DRxCollectionController.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import RxCocoa
import RxSwift
import UIKit

open class DRxCollectionController: UICollectionViewController {

    // MARK: Properties

    public var hidesBackButtonTitle: Bool = true

    public let disposeBag: DisposeBag = .init()

    public init(layout: UICollectionViewFlowLayout = .init()) {
        super.init(collectionViewLayout: layout)
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

        self.collectionView.dataSource = nil // IGNORE: This is just for running RxSwift with UICollectionViewController
        self.collectionView.backgroundColor = .systemGroupedBackground
    }

    open func bind() {}
}

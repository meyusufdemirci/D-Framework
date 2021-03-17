//
//  DRxCollectionCell.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import RxCocoa
import RxGesture
import RxSwift
import UIKit

open class DRxCollectionCell: UICollectionViewCell {

    // MARK: Properties

    public var disposeBag: DisposeBag = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = .init()
    }

    open func setup() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
    }

    open func update() {
        bind()
    }

    open func bind() {}
}

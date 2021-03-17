//
//  DRxTableCell.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import RxAnimated
import RxCocoa
import RxGesture
import RxSwift
import UIKit

open class DRxTableCell: UITableViewCell {

    // MARK: Properties

    public var disposeBag: DisposeBag = .init()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
        self.selectionStyle = .none
    }

    public func update() {
        bind()
    }

    open func bind() {}
}

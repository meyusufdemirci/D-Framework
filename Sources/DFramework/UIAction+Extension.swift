//
//  UIAction+Extension.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import UIKit

public extension UIAction {

    convenience init(title: String, image: UIImage?, state: UIMenuElement.State = .off, attribute: UIMenuElement.Attributes? = nil, completion: @escaping() -> Void) {
        self.init(title: title, image: image, state: state) { _ in
            completion()
        }
        if let attribute = attribute {
            self.attributes = attribute
        }
    }

    static func edit(completion: @escaping () -> Void) -> UIAction {
        .init(title: "General.edit".localized, image: .init(systemName: "square.and.pencil"), completion: completion)
    }

    static func share(completion: @escaping () -> Void) -> UIAction {
        .init(title: "General.share".localized, image: .init(systemName: "square.and.arrow.up"), completion: completion)
    }

    static func copy(completion: @escaping () -> Void) -> UIAction {
        .init(title: "General.copy".localized, image: .init(systemName: "doc.on.doc"), completion: completion)
    }

    static func archive(completion: @escaping () -> Void) -> UIAction {
        .init(title: "General.archive".localized, image: .init(systemName: "archivebox"), completion: completion)
    }

    static func delete(completion: @escaping () -> Void) -> UIAction {
        .init(title: "General.delete".localized, image: .init(systemName: "trash"), attribute: .destructive, completion: completion)
    }
}

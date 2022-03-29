//
//  DAlertManager.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import UIKit

public class DAlertManager {

    static func info(
        _ info: String,
        title: String? = "General.info".localized,
        buttonTitle: String = "General.ok".localized,
        controller: UIViewController,
        hideKeyboard: Bool = true,
        handler: (() -> Void)? = nil
    ) {
        let alertController: UIAlertController = .init(title: title, message: info, preferredStyle: .alert)
        alertController.addAction(.init(title: buttonTitle, style: .cancel, handler: { _ in
            handler?()
        }))
        showAlert(alertController, presentingController: controller, hideKeyboard: hideKeyboard)
    }

    static func error(
        _ error: DError,
        title: String? = "General.error".localized,
        hideKeyboard: Bool = true,
        controller: UIViewController,
        handler: (() -> Void)? = nil
    ) {
        let alertController: UIAlertController = .init(title: title, message: error.userFriendlyDescription, preferredStyle: .alert)
        alertController.addAction(.init(title: "General.ok".localized, style: .cancel, handler: { _ in
            handler?()
        }))
        showAlert(alertController, presentingController: controller, hideKeyboard: hideKeyboard)
    }

    static func confirm(
        message: String,
        title: String? = "General.confirmation".localized,
        confirmButtonTitle: String = "General.confirm".localized,
        controller: UIViewController,
        hideKeyboard: Bool = true,
        confirmHandler: (() -> Void)? = nil,
        cancelHandler: (() -> Void)? = nil
    ) {
        let alertController: UIAlertController = .init(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "General.cancel".localized, style: .cancel, handler: { _ in
            cancelHandler?()
        }))
        alertController.addAction(.init(title: confirmButtonTitle, style: .destructive, handler: { _ in
            confirmHandler?()
        }))
        showAlert(alertController, presentingController: controller, hideKeyboard: hideKeyboard)
    }

    static func actionSheet(
        items: [String],
        title: String? = nil,
        message: String? = nil,
        controller: UIViewController,
        hideKeyboard: Bool = true,
        selectionHandler: @escaping(_ selectedIndex: Int, _ selectedItem: String) -> Void,
        cancelHandler: (() -> Void)? = nil
    ) {
        let alertController: UIAlertController = .init(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(.init(title: "General.cancel".localized, style: .cancel, handler: { _ in
            cancelHandler?()
        }))
        for (index, item) in items.enumerated() {
            let action: UIAlertAction = .init(title: item, style: .default) { _ in
                selectionHandler(index, item)
            }
            alertController.addAction(action)
        }
        showAlert(alertController, presentingController: controller, hideKeyboard: hideKeyboard)
    }

    static func custom(
        title: String? = nil,
        message: String? = nil,
        buttonTitle: String = "General.ok".localized,
        controller: UIViewController,
        hideKeyboard: Bool = true,
        handler: (() -> Void)? = nil
    ) {
        let alertController: UIAlertController = .init(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: buttonTitle, style: .cancel, handler: { _ in
            handler?()
        }))
        showAlert(alertController, presentingController: controller, hideKeyboard: hideKeyboard)
    }
}

private extension DAlertManager {

    static func hideLoading() {
        DispatchQueue.main.async {
            DLoadingManager.shared.hide(immediately: true)
        }
    }

    static func showAlert(_ alertController: UIAlertController, presentingController: UIViewController, hideKeyboard: Bool) {
        hideLoading()
        if hideKeyboard {
            DUtil.hideKeyboard()
        }
        presentingController.present(alertController, animated: true)
    }
}

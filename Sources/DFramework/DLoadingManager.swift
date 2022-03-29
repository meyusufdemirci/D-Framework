//
//  DLoadingManager.swift
//  
//
//  Created by Yusuf Demirci on 29.03.2022.
//

import SnapKit
import UIKit

public class DLoadingManager {

    static let shared: DLoadingManager = .init()

    private let loadingView: DLoadingView = .init()

    private var isEnabled: Bool = false
    private var lastShowDate: Date?
    private let minAppearMilliseconds: Int = 500
}

// MARK: - Publics

extension DLoadingManager {

    func show(immediately: Bool = false) {
        if isEnabled { return }
        isEnabled = true

        self.loadingView.alpha = 0

        UIWindow.activeWindow?.isUserInteractionEnabled = false

        UIWindow.activeWindow?.addSubview(self.loadingView)
        UIWindow.activeWindow?.bringSubviewToFront(self.loadingView)

        self.loadingView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        self.loadingView.indicatorView.startAnimating()

        self.lastShowDate = Date()

        UIView.animate(withDuration: DUI.animationDuration1) {
            self.loadingView.alpha = 1
        } completion: { _ in }
    }

    func hide(immediately: Bool = false) {
        guard isEnabled else { return }

        if immediately {
            UIView.animate(withDuration: DUI.animationDuration2) {
                self.loadingView.alpha = 0
            } completion: { _ in
                self.hideCompletion()
            }

            return
        }

        var deadline: TimeInterval {
            guard let lastShowDate = lastShowDate,
                  let interval = (Date() - lastShowDate).milliseconds else {
                      return .init(0)
                  }
            let difference = minAppearMilliseconds - interval
            return .init(difference)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(deadline))) {
            UIView.animate(withDuration: DUI.animationDuration1) {
                self.loadingView.alpha = 0
            } completion: { _ in
                self.hideCompletion()
            }
        }
    }
}

// MARK: - Privates

private extension DLoadingManager {

    func hideCompletion() {
        self.loadingView.indicatorView.stopAnimating()
        self.loadingView.removeFromSuperview()
        self.isEnabled = false
        UIWindow.activeWindow?.isUserInteractionEnabled = true
    }
}

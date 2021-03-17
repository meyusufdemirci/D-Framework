//
//  AnimatedSink+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 17.03.21.
//

import RxAnimated
import RxCocoa
import RxSwift

public extension AnimatedSink where Base: UIView {

    var transform: Binder<CGAffineTransform> {
        Binder(self.base) { view, transform in
            self.type.animate(view: view, binding: {
                view.transform = transform
            })
        }
    }
}

public extension AnimatedSink where Base: UIView {

    func pump(duration: TimeInterval = DConstant.UiUx.animationDuration) -> AnimatedSink<Base> {
        let type: AnimationType<Base> = .init(type: .animation, duration: duration, animations: nil)
        return AnimatedSink<Base>(base: self.base, type: type)
    }
}

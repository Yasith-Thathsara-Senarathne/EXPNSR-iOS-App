//
//  Router.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import RxSwift
import Action

public protocol Router: class {
    func route(_ viewController: UIViewController, animated: Bool, _ dismissAction: CocoaAction?)
    func route(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
}

extension Router {
    public func route(_ viewController: UIViewController, animated: Bool) {
        route(viewController, animated: animated, nil)
    }
}

extension Router where Self: NavigationRouter {
    public func dismissToRoot(isAnimated animated: Bool) {}
    public func setTempVisibleBackTitle(set visible: Bool) {}
}

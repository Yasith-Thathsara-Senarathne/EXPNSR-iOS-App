//
//  AppDelegateRouter.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Action

public class AppDelegateRouter: Router {
    
    public weak var window:UIWindow!
    
    public init(_ window:UIWindow){
        self.window = window
    }
    
    public func route(_ viewController: UIViewController, animated: Bool, _ dismissAction: CocoaAction?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool) {}
}

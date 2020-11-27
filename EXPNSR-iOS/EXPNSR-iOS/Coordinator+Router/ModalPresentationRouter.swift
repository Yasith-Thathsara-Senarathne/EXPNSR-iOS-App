//
//  ModalPresentationRouter.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import Action

final class ModalPresentationRouter: Router {
    private weak var rootViewController:UIViewController?
    private var dismissAction:CocoaAction?
    private var presentationStyle: UIModalPresentationStyle!
    private var transitionStyle: UIModalTransitionStyle!
    
    public init(_ rootVC: UIViewController,
                presentation presentationStyle:UIModalPresentationStyle = .formSheet,
                withTransition transitionStyle: UIModalTransitionStyle = .coverVertical){
        
        self.rootViewController = rootVC
        self.presentationStyle = presentationStyle
        self.transitionStyle = transitionStyle
    }
    
    public func route(_ viewController: UIViewController, animated: Bool, _ dismissAction: CocoaAction?){
        viewController.modalPresentationStyle = presentationStyle
        viewController.modalTransitionStyle = transitionStyle
        rootViewController?.present(viewController, animated: true, completion: nil)
        
        rootViewController = viewController
        self.dismissAction = dismissAction
    }
    
    public func dismiss(animated: Bool) {
        rootViewController?.dismiss(animated: animated, completion: nil)
        dismissAction?.execute()
        dismissAction = nil
        rootViewController = nil
    }
}

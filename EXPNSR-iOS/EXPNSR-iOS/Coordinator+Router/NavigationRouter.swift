//
//  NavigationRouter.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import RxSwift
import Action

public class NavigationRouter: NSObject {
    weak var navigationController: UINavigationController!
    
    private var popActionsToPerform = [UIViewController:CocoaAction]()
    
    var isHideBackButtonText: Bool = false
    
    private var isHidebackButtonTemp = false
    private var isChangedBackButtonTitleVisibilityTemp = false
    
    public init(_ navigationController: UINavigationController ){
        self.navigationController = navigationController
        super.init()
        
        navigationController.rx
            .didShow
            .map{ result -> UIViewController in
                guard let dismissedVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else{
                    return result.viewController
                }
                return dismissedVC
            }.filter{
                return !navigationController.viewControllers.contains($0)
            }
            .subscribe(onNext:{[weak self] in
                self?.performDismissAction(for: $0)
            }).disposed(by: rx.disposeBag)
    }
}

//MARK:- Router
extension NavigationRouter: Router {
    
    public func route(_ viewController: UIViewController, animated: Bool,_ dismissAction: CocoaAction?){
        if let _action = dismissAction{
            popActionsToPerform[viewController] = _action
        }
        
        setNavigationBarBackButtonTextAppearance(in: viewController)
        
        if isChangedBackButtonTitleVisibilityTemp {
            isHideBackButtonText = isHidebackButtonTemp
            isChangedBackButtonTitleVisibilityTemp = false
        }
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    private func performDismissAction(for viewController:UIViewController){
        guard let action = popActionsToPerform[viewController] else { return }
        action.execute()
        popActionsToPerform[viewController] = nil
    }
    
    public func dismiss(animated: Bool) {
        self.navigationController.popViewController(animated: animated)
    }
    
    public func dismissToRoot(isAnimated animated: Bool) {
        navigationController.popToRootViewController(animated: true)
        emptyDismissActions()
    }
    
    public func emptyDismissActions() {
        popActionsToPerform.enumerated().forEach { [weak self] in
            self?.performDismissAction(for: $0.element.key)
        }
    }
}

//Navigation bar local configuration for router
extension NavigationRouter {
    fileprivate func setNavigationBarBackButtonTextAppearance(in viewController: UIViewController) {
        if isHideBackButtonText {
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        } else {
            viewController.navigationItem.backBarButtonItem = nil
        }
    }
    
    public func setTempVisibleBackTitle(set visible: Bool) {
        isHidebackButtonTemp = isHideBackButtonText
        isHideBackButtonText = !visible
        isChangedBackButtonTitleVisibilityTemp = true
    }
}

////MARK: - Controll Navigation custom animation
//extension NavigationRouter: UINavigationControllerDelegate {
//    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        switch toVC {
//        case is CreateAdTypesViewController:
//            if operation == .push {
//                return NavigationOverCurrentContextTransition(presenting: true)
//            } else {
//                return NavigationOverCurrentContextTransition(presenting: false)
//            }
//
//        default:
//            return nil
//        }
//
//    }
//}

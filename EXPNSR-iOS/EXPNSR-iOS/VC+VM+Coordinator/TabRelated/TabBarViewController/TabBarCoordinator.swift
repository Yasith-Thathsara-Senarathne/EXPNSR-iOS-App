//
//  ViewController.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import MNkSupportUtilities
import RxSwift
import Action

class TabBarCoordinator: Coordinator {
    
    // Class properties
    var children: [Coordinator] = []
    var router: Router
    
    private var homeRouter: NavigationRouter!
    private var emptyRouter: NavigationRouter!
    private var profileRouter: NavigationRouter!
    
    init(_ router: Router) {
        self.router = router
    }
    
    func coordinate(animated: Bool, _ action: CocoaAction?) {
        //Root tab bar
        let rootViewController = TabBarViewController()
        rootViewController.didSelectTab = didSelectTab
        rootViewController.bind()
        
        //Home view controller
        var homeViewController = HomeViewController()
        let viewModel = HomeViewModel()
        homeViewController.bindViewModel(to: viewModel)
        
        let homeNavigationController = UINavigationController.init(rootViewController: homeViewController)
        homeRouter = NavigationRouter.init(homeNavigationController)
        
        let emptyViewController = UINavigationController.init(rootViewController: MNkViewController())
        
        let profileViewController = UINavigationController.init(rootViewController: ProfileViewController())
        profileRouter = NavigationRouter.init(profileViewController)
        
        rootViewController.prepareTabs([homeNavigationController, emptyViewController, profileViewController])
        router.route(rootViewController, animated: animated, action)
    }
    
    // Perform bind on initial tab tapping
    private lazy var didSelectTab: Action<UIViewController, Void> = Action { [weak self] in
        guard let navController = $0 as? UINavigationController,
            let rootViewController = navController.viewControllers.first else { return .empty() }
        
        self?.doBind(of: rootViewController)
        return .empty()
    }
}

//MARK:- Perform bind on initial tab tapping
extension TabBarCoordinator {
    private func doBind(of viewController: UIViewController) {
        switch viewController {
        case is ProfileViewController:
            guard var `viewController` = viewController as? ProfileViewController, viewController.viewModel == nil else { return }
            let viewModel = ProfileViewModel()
            viewController.bindViewModel(to: viewModel)
            
        default:
            break
        }
    }
}


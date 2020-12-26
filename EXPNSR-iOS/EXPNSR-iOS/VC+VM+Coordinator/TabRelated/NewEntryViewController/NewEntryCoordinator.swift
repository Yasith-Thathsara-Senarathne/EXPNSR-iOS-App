//
//  NewEntryCoordinator.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class NewEntryCoordinator: Coordinator {
    var children: [Coordinator] = []
    var router: Router
    var tabBar: UITabBar
    
    init(_ router: Router, _ tabBar: UITabBar) {
        self.router = router
        self.tabBar = tabBar
    }
    
    func coordinate(animated: Bool, _ action: CocoaAction?) {
        var viewController = NewEntryViewController()
        var viewModel = NewEntryViewModel()
        viewModel.didTapCloseButton = didTapCloseButton
        
        viewController.bindViewModel(to: viewModel)
        router.route(viewController, animated: true)
        tabBar.isHidden = true
    }
    
    lazy var didTapCloseButton: CocoaAction = CocoaAction { [weak self] in
        self?.router.dismiss(animated: true)
        self?.tabBar.isHidden = false
        return .empty()
    }
}


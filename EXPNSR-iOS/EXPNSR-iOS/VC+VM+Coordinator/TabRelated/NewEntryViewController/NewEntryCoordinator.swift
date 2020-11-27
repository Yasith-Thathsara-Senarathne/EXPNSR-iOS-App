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
    
    init(_ router: Router) {
        self.router = router
    }
    
    func coordinate(animated: Bool, _ action: CocoaAction?) {
        var viewController = NewEntryViewController()
        let viewModel = NewEntryViewModel()
        
        viewController.bindViewModel(to: viewModel)
        router.route(viewController, animated: true)
    }
    
    lazy var dismissVC: CocoaAction = CocoaAction { [weak self] in
        self?.router.dismiss(animated: true)
        return .empty()
    }
}


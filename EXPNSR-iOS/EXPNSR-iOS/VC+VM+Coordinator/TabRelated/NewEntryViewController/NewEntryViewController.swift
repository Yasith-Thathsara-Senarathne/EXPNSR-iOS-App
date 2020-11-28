//
//  NewEntryViewController.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import MNkSupportUtilities
import RxSwift
import Action

class NewEntryViewController: MNkTVC_EmptyCellType<MNkEmptyTVCell>, BindableType {
    // Class properties
    var viewModel: NewEntryViewModel!
    
    private let customNavigationBar = CustomNavigationBar().chain.bgColor(.clear).component
    
    override func config() {
        view.backgroundColor = .viewBackground
    }
    
    override func createViews() {
        super.createViews()
        customNavigationBar.titleText = "New Entry"
        customNavigationBar.isCloseButtonHidden = false
        
        tableview.chain
            .dataSource(nil)
            .contentInset(.init(top: safeAreaEdgeInsets.top + 20, left: 0, bottom: 0, right: 0))
            .seperatorStyle(.none)
            .bgColor(.clear)
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(customNavigationBar)
        customNavigationBar.activateLayouts([.top: safeAreaEdgeInsets.top + 20, .leading: 16, .traling: -16, .height: 40])
    }
    
    func bindViewModel() {
        customNavigationBar.closeButton.rx.tap
            .bind(to: viewModel.didTapCloseButton.inputs)
            .disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarBackground(hidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.setTabBarHidden(true, animated: true)
    }
}

//MARK:- Navigation bar transparent compatablity
extension NewEntryViewController: NavigationBarTransparentCompitable {}

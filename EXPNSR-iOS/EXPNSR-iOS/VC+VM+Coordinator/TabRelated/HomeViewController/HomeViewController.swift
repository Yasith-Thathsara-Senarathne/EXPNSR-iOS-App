//
//  HomeViewController.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import MNkSupportUtilities
import RxSwift
import Action

class HomeViewController: MNkTVC_EmptyCellType<MNkEmptyTVCell>, BindableType {
    // Class properties
    var viewModel: HomeViewModel!
    
    // To get tab bar height
    private var tabBarHeight: CGFloat {
        guard let _tabBar = self.tabBarController?.tabBar else{ return 50 + safeAreaEdgeInsets.bottom }
        return _tabBar.bounds.height + safeAreaEdgeInsets.bottom
    }
    
    override func config() {
        view.backgroundColor = .viewBackground
        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    override func createViews() {
        super.createViews()
        tableview.chain
            .dataSource(nil)
            .contentInset(.init(top: 0, left: 0, bottom: tabBarHeight, right: 0))
            .seperatorStyle(.none)
            .bgColor(.clear)
    }
    
    func bindViewModel() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarBackground(hidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.setTabBarHidden(false, animated: true)
    }
}

//MARK:- Navigation bar transparent compatablity
extension HomeViewController: NavigationBarTransparentCompitable {}

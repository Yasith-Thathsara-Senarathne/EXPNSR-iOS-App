//
//  ProfileViewController.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import MNkSupportUtilities
import RxSwift
import Action

class ProfileViewController: MNkTVC_EmptyCellType<MNkEmptyTVCell>, BindableType {
    // Class properties
    var viewModel: ProfileViewModel!
    
    private let customNavigationBar = CustomNavigationBar().chain.bgColor(.viewBackground).component
    
    //To get tab bar height
    private var tabBarHeight: CGFloat {
        guard let _tabBar = self.tabBarController?.tabBar else{ return 50 + safeAreaEdgeInsets.bottom }
        return _tabBar.bounds.height + safeAreaEdgeInsets.bottom
    }
    
    // Custom navbar height
    private var customNavBarHeight: CGFloat {
        return (safeAreaEdgeInsets.top + 20) + 40 + 20
    }
    
    deinit {
        print("deinit ProfileViewController")
    }
    
    override func config() {
        view.backgroundColor = .viewBackground
        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    override func createViews() {
        super.createViews()
        customNavigationBar.titleText = "EXPNSR"
        customNavigationBar.isCloseButtonHidden = true
        
        tableview.chain
            .dataSource(nil)
            .contentInset(UIEdgeInsets.init(top: customNavBarHeight - 20, left: 0, bottom: tabBarHeight, right: 0))
            .seperatorStyle(.none)
            .bgColor(.clear)
    }
    
    override func insertAndLayoutSubviews() {
        super.insertAndLayoutSubviews()
        view.addSubview(customNavigationBar)
        customNavigationBar.activateLayouts([.top: 0, .leading: 0, .traling: 0, .height: customNavBarHeight])
    }
    
    func bindViewModel() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarBackground(hidden: true)
    }
}

//MARK:- Navigation bar transparent compatablity
extension ProfileViewController: NavigationBarTransparentCompitable {}

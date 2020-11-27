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
    
    override func config() {
        view.backgroundColor = .viewBackground
    }
    
    override func createViews() {
        super.createViews()
        tableview.chain
            .dataSource(nil)
            .seperatorStyle(.none)
            .bgColor(.clear)
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

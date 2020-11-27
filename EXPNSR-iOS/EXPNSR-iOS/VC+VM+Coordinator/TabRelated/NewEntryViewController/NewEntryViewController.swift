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
extension NewEntryViewController: NavigationBarTransparentCompitable {}

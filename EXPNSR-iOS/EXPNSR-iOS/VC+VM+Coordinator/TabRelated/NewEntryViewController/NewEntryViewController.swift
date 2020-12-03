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
import RxDataSources

class NewEntryViewController: MNkTVC_EmptyCellType<MNkEmptyTVCell>, BindableType {
    // Class properties
    var viewModel: NewEntryViewModel!
    
    private let customNavigationBar = CustomNavigationBar().chain.bgColor(.viewBackground).component
    
    private var cellId: String {
        return "NewEntryTVCell"
    }
    
    private var customNavBarHeight: CGFloat {
        return (safeAreaEdgeInsets.top + 20) + 40 + 20
    }
    
    deinit {
        print("deinit NewEntryViewController")
    }
    
    override func config() {
        view.backgroundColor = .viewBackground
        self.extendedLayoutIncludesOpaqueBars = true
        
        viewModel.setNewEntryCells()
    }
    
    override func createViews() {
        super.createViews()
        customNavigationBar.titleText = "New Entry"
        customNavigationBar.isCloseButtonHidden = false
        
        tableview.chain
            .dataSource(nil)
            .register(NewEntryTVCell.self, with: cellId)
            .contentInset(UIEdgeInsets.init(top: customNavBarHeight, left: 0, bottom: 0, right: 0))
            .seperatorStyle(.none)
            .bgColor(.clear)
    }
    
    override func insertAndLayoutSubviews() {
        super.insertAndLayoutSubviews()
        view.addSubview(customNavigationBar)
        customNavigationBar.activateLayouts([.top: 0, .leading: 0, .traling: 0, .height: customNavBarHeight])
    }
    
    func bindViewModel() {
        customNavigationBar.closeButton.rx.tap
            .bind(to: viewModel.didTapCloseButton.inputs)
            .disposed(by: rx.disposeBag)
        
        viewModel.newEntryCells
            .bind(to: tableview.rx.items(dataSource: bindedDataSource))
            .disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarBackground(hidden: true)
    }
}

//MARK:- Navigation bar transparent compatablity
extension NewEntryViewController: NavigationBarTransparentCompitable {}


extension NewEntryViewController {
    private var bindedDataSource: RxTableViewSectionedReloadDataSource<NewEntryCellModel> {
        let dataSource = RxTableViewSectionedReloadDataSource<NewEntryCellModel>(configureCell:{
            _,
            tableView,
            indexPath,
            element in
            
            switch element {
            case .newEntry:
                let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! NewEntryTVCell
                return cell
            }
        })
        return dataSource
    }
}

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
import RxDataSources

class HomeViewController: MNkTVC_EmptyCellType<MNkEmptyTVCell>, BindableType {
    // Class properties
    var viewModel: HomeViewModel!
    
    private let customNavigationBar = CustomNavigationBar().chain.bgColor(.viewBackground).component
    
    //For tableview cell id types
    private enum cellId: String {
        case monthSelectionCellId = "monthSelection_cell_id"
        case totalExpensesCellId = "totalExpenses_cell_id"
        case hashCategoryCellId = "hashCategory_cell_id"
    }
    
    // To get tab bar height
    private var tabBarHeight: CGFloat {
        guard let _tabBar = self.tabBarController?.tabBar else{ return 50 + safeAreaEdgeInsets.bottom }
        return _tabBar.bounds.height + safeAreaEdgeInsets.bottom
    }
    
    // Custom navbar height
    private var customNavBarHeight: CGFloat {
        return (safeAreaEdgeInsets.top + 20) + 40 + 20
    }
    
    // For dispose all request observers
    private var dbReferenceDisposable: Disposable?
    
    deinit {
        print("deinit HomeViewController")
    }
    
    override func config() {
        view.backgroundColor = .viewBackground
        self.extendedLayoutIncludesOpaqueBars = true
        
        let previousMonth: MonthModel = MonthModel(id: Genaric().getCurrentDateAndTime(type: .dateAsId, addMonths: -1), title: Genaric().getCurrentDateAndTime(type: .yearWithMonth, addMonths: -1))
        let currentMonth: MonthModel = MonthModel(id: Genaric().getCurrentDateAndTime(type: .dateAsId), title: Genaric().getCurrentDateAndTime(type: .yearWithMonth))
        let nextMonth: MonthModel = MonthModel(id: Genaric().getCurrentDateAndTime(type: .dateAsId, addMonths: 1), title: Genaric().getCurrentDateAndTime(type: .yearWithMonth, addMonths: 1))
        
        viewModel.checkMonthsExists(for: previousMonth, currentMonth: currentMonth, nextMonth: nextMonth)
    }
    
    override func createViews() {
        super.createViews()
        customNavigationBar.titleText = "EXPNSR"
        customNavigationBar.isCloseButtonHidden = true
        
        tableview.chain
            .dataSource(nil)
            .register(MonthSelectionTVCell.self, with: cellId.monthSelectionCellId.rawValue)
            .register(TotalExpensesTVCell.self, with: cellId.totalExpensesCellId.rawValue)
            .register(HashCategoryTVCell.self, with: cellId.hashCategoryCellId.rawValue)
            .contentInset(UIEdgeInsets.init(top: 40, left: 0, bottom: 0, right: 0))
            .seperatorStyle(.none)
            .bgColor(.clear)
    }
    
    override func insertAndLayoutSubviews() {
        super.insertAndLayoutSubviews()
        view.addSubview(customNavigationBar)
        customNavigationBar.activateLayouts([.top: 0, .leading: 0, .traling: 0, .height: customNavBarHeight])
    }
    
    func bindViewModel() {
        let cellsShared = viewModel.cells.share(replay: 1, scope: .whileConnected)
        cellsShared
            .asObservable()
            .bind(to: tableview.rx.items(dataSource: bindedDataSource))
            .disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarBackground(hidden: true)
        
        bindUI()
    }
    
    private func bindUI() {
        let monthRealmDataShared = viewModel.monthRealmData.map { $0.toArray() }.share(replay: 1, scope: .whileConnected)
        
        dbReferenceDisposable?.dispose()
        dbReferenceDisposable = monthRealmDataShared
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.viewModel.updateUIWithNewData(with: $0)
            })
    }
}

//MARK:- Navigation bar transparent compatablity
extension HomeViewController: NavigationBarTransparentCompitable {}

extension HomeViewController {
    private var bindedDataSource: RxTableViewSectionedReloadDataSource<HomeCellModel> {
        let dataSource = RxTableViewSectionedReloadDataSource<HomeCellModel>(configureCell:{
            _,
            tableView,
            indexPath,
            element in
            
            switch element {
            case let .monthSelection(data):
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId.monthSelectionCellId.rawValue, for: indexPath) as! MonthSelectionTVCell
                cell.data = data
                return cell
            case .totalExpenses:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId.totalExpensesCellId.rawValue, for: indexPath) as! TotalExpensesTVCell
                return cell
            case .hashCategory:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId.hashCategoryCellId.rawValue, for: indexPath) as! HashCategoryTVCell
                return cell
            }
        })
        return dataSource
    }
}

//
//  HomeViewModel.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources
import RealmSwift

typealias MonthModel = (id: String, title: String)
typealias HomeCellModel = AnimatableSectionModel<String, HomeViewModel.CellType>

protocol HomeViewModelType {
    
    var monthRealmData: Observable<Results<MonthRealmModel>> { mutating get }
    
    var cells: Observable<[HomeCellModel]>! { get }
    
    func checkMonthsExists(for currentMonth: MonthModel, nextMonth: MonthModel)
    
    func updateUIWithNewData(with data: [MonthRealmModel])
}

struct HomeViewModel: HomeViewModelType {
    
    lazy var monthRealmData: Observable<Results<MonthRealmModel>> = {
        return Observable.collection(from: realmService.getMonthRealmData())
    }()
    
    var cells: Observable<[HomeCellModel]>! { cellsSubject.asObservable() }
    
    private var cellsSubject = PublishSubject<[HomeCellModel]>()
    
    private var realmService: MonthRealmServiceType = MonthRealmService()
    
    func checkMonthsExists(for currentMonth: MonthModel, nextMonth: MonthModel) {
        if !realmService.objectExists(id: currentMonth.id) {
            let monthRealmModel = MonthRealmModel()
            monthRealmModel.id = currentMonth.id
            monthRealmModel.title = currentMonth.title
            monthRealmModel.monthlyExpense = 0.00
            monthRealmModel.isSynced = false
            
            realmService.createMonthRealmData(with: monthRealmModel)
        }
        
        if !realmService.objectExists(id: nextMonth.id) {
            let monthRealmModel = MonthRealmModel()
            monthRealmModel.id = nextMonth.id
            monthRealmModel.title = nextMonth.title
            monthRealmModel.monthlyExpense = 0.00
            monthRealmModel.isSynced = false
            
            realmService.createMonthRealmData(with: monthRealmModel)
        }
    }
    
    func updateUIWithNewData(with data: [MonthRealmModel]) {
        let monthSelectionData = HomeCellModel.init(model: "", items: [CellType.monthSelection(data.map { MonthModel(id: $0.id, title: $0.title) })])
        let totalExpensesData = HomeCellModel.init(model: "", items: [.totalExpenses])
        let hashCategoryData = HomeCellModel.init(model: "", items: [.hashCategory])
        
        cellsSubject.onNext([monthSelectionData, totalExpensesData, hashCategoryData])
    }
}

//MARK:- Home TableView Section Configuration
extension HomeViewModel {
    enum CellType {
        case monthSelection([MonthModel])
        case totalExpenses
        case hashCategory
        
        fileprivate var _id: Int {
            switch self {
            case .monthSelection:
                return 0
            case .totalExpenses:
                return 1
            case .hashCategory:
                return 2
            }
        }
    }
}

extension HomeViewModel.CellType: IdentifiableType, Equatable {
    static func == (lhs: HomeViewModel.CellType, rhs: HomeViewModel.CellType)-> Bool {
        return lhs._id == rhs._id
    }
    
    var identity: Int{
        return self._id
    }
}

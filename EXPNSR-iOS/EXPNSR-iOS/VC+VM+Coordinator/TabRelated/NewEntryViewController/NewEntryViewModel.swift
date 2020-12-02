//
//  NewEntryViewModel.swift
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

typealias NewEntryCellModel = AnimatableSectionModel<String, NewEntryViewModel.CellType>

protocol NewEntryViewModelType {
    var didTapCloseButton: CocoaAction! { get }
    
    var newEntryCells: Observable<[NewEntryCellModel]> { get }
    
    func setNewEntryCells()
}

struct NewEntryViewModel: NewEntryViewModelType {
    var didTapCloseButton: CocoaAction!
    
    var newEntryCells: Observable<[NewEntryCellModel]> { return newEntryCellsSubject.asObservable() }
    
    private let newEntryCellsSubject: BehaviorRelay<[NewEntryCellModel]> = .init(value: [])
    
    func setNewEntryCells() {
        newEntryCellsSubject.accept([.init(model: "", items: [.newEntry])])
    }
}

//MARK:- New Entry TableView Section Configuration
extension NewEntryViewModel {
    enum CellType {
        case newEntry
        
        fileprivate var _id: Int {
            switch self {
            case .newEntry:
                return 0
            }
        }
    }
}

extension NewEntryViewModel.CellType: IdentifiableType, Equatable {
    static func == (lhs: NewEntryViewModel.CellType, rhs: NewEntryViewModel.CellType)-> Bool {
        return lhs._id == rhs._id
    }
    
    var identity: Int{
        return self._id
    }
}

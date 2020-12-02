//
//  MonthRealmServiceType.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import RxSwift
import RealmSwift

protocol MonthRealmServiceType {
    
    func objectExists(id: String) -> Bool
    
    func createMonthRealmData(with data: MonthRealmModel)
    
    func getMonthRealmData(for id: String) -> Results<MonthRealmModel>
    
    func getMonthRealmData() -> Results<MonthRealmModel>
}

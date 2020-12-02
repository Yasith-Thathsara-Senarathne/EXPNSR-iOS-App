//
//  MonthRealmService.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxRealm

struct MonthRealmService: RealmService, MonthRealmServiceType {
    
    func objectExists(id: String) -> Bool {
        do {
            let realm = try Realm()
            return realm.object(ofType: MonthRealmModel.self, forPrimaryKey: id) != nil
        } catch let error {
            print("Failed realm with error: \(error)")
        }
        return false
    }
    
    func createMonthRealmData(with data: MonthRealmModel) {
        withRealm("Create month realm data") { db -> Void in
            try db.write {
                db.add(data, update: .all)
            }
            db.refresh()
        }
    }
    
    func getMonthRealmData(for id: String) -> Results<MonthRealmModel> {
        let result =  withRealm("Fetch month realm data for \(id)") { db -> Results<MonthRealmModel> in
            let result = db.objects(MonthRealmModel.self).filter("id = %@", id)
            return result
        }
        return result!
    }
    
    func getMonthRealmData() -> Results<MonthRealmModel> {
        let result =  withRealm("Fetch month realm data") { db -> Results<MonthRealmModel> in
            let result = db.objects(MonthRealmModel.self)
            return result
        }
        return result!
    }
}

//
//  HashCategoryRealmService.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 2/5/21.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa
import RxRealm

struct HashCategoryRealmService: RealmService, HashCategoryRealmServiceType {
    
    func objectExists(id: String) -> Bool {
        do {
            let realm = try Realm()
            return realm.object(ofType: HashCategoryRealmModel.self, forPrimaryKey: id) != nil
        } catch let error {
            print("Failed realm with error: \(error)")
        }
        return false
    }
    
    func createHashCategoryRealmData(with data: HashCategoryRealmModel) {
        withRealm("Create hash category realm data") { db -> Void in
            try db.write {
                db.add(data, update: .all)
            }
            db.refresh()
        }
    }
    
    func getHashCategoryRealmData(for id: String) -> Results<HashCategoryRealmModel> {
        let result =  withRealm("Fetch hash category realm data for \(id)") { db -> Results<HashCategoryRealmModel> in
            let result = db.objects(HashCategoryRealmModel.self).filter("id = %@", id)
            return result
        }
        return result!
    }
    
    func getHashCategoryRealmData() -> Results<HashCategoryRealmModel> {
        let result =  withRealm("Fetch hash category realm data") { db -> Results<HashCategoryRealmModel> in
            let result = db.objects(HashCategoryRealmModel.self)
            return result
        }
        return result!
    }
}

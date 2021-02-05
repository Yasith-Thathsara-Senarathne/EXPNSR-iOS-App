//
//  HashCategoryRealmServiceType.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 2/5/21.
//

import Foundation
import RxSwift
import RealmSwift

protocol HashCategoryRealmServiceType {
    
    func objectExists(id: String) -> Bool
    
    func createHashCategoryRealmData(with data: HashCategoryRealmModel)
    
    func getHashCategoryRealmData(for id: String) -> Results<HashCategoryRealmModel>
    
    func getHashCategoryRealmData() -> Results<HashCategoryRealmModel>
}

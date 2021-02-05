//
//  HashCategoryRealmModel.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 2/5/21.
//

import Foundation
import RealmSwift

@objcMembers
class HashCategoryRealmModel: Object {
    dynamic var id = ""
    dynamic var hashCategory = ""
    dynamic var isSynced = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

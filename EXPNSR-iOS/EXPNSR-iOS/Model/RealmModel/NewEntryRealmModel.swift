//
//  NewEntryRealmModel.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 2/5/21.
//

import Foundation
import RealmSwift

@objcMembers
class NewEntryRealmModel: Object {
    dynamic var id = ""
    dynamic var monthId: MonthRealmModel!
    dynamic var hashCategory: HashCategoryRealmModel!
    dynamic var value = 0.00
    dynamic var date = ""
    dynamic var isSynced = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

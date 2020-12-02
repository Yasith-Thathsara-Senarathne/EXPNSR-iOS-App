//
//  MonthsRealmModel.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import RealmSwift

@objcMembers
class MonthRealmModel: Object {
    dynamic var id = ""
    dynamic var title = ""
    dynamic var monthlyExpense = 0.00
    dynamic var isSynced = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

//
//  Genaric.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import UIKit

struct Genaric {
    
    enum DateType: String {
        case dateAsId = "MM/yyyy"
        case dayWithMonthAndTime = "dd MMM, h:mm a"
        case yearWithMonth = "yyyy MMM"
        
        func value() -> String {
            return self.rawValue
        }
    }
    
    func getCurrentDateAndTime(type: DateType, addMonths: Int = 0) -> String {
        let dateFormatter = DateFormatter()
        guard let date = Calendar.current.date(byAdding: .month, value: addMonths, to: Date()) else {
            return ""
        }
         
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = type.value()
        return dateFormatter.string(from: date)
    }
    
    func getCurrencyCodeForLocale() -> String {
        let locale = Locale.current
        return locale.currencyCode ?? ""
    }
}

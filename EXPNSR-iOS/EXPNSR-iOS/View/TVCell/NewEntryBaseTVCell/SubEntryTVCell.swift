//
//  SubEntryTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation

class SubEntryTVCell: NewEntryBaseTVCell {
    
    override func createViews() {
        
        categoryEntryView.placeholderText = "Sub Entry"
        categoryEntryView.isHideCurrencyLabel = true
        categoryEntryView.textFieldKeyboadType = .default
        
        valueEntryView.placeholderText = "0.00"
        valueEntryView.isHideCurrencyLabel = false
        valueEntryView.textFieldKeyboadType = .decimalPad
        
        dateEntryView.placeholderText = Genaric().getCurrentDateAndTime(type: .dayWithMonthAndTime)
        dateEntryView.isHideCurrencyLabel = true
        dateEntryView.textFieldKeyboadType = .default
        
        
    }
}

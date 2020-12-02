//
//  NewEntryTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/29/20.
//

import Foundation

class NewEntryTVCell: NewEntryBaseTVCell {
    
    override func createViews() {
        
        categoryEntryView.placeholderText = "#Category"
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

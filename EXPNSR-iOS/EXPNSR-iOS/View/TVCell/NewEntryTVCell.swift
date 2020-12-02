//
//  NewEntryTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/29/20.
//

import Foundation
import MNkSupportUtilities
import Action

class NewEntryTVCell: MNkTableViewCell {
    private let mainSV = UIStackView().chain.vStack.spacing(12).component
    private let categoryEntryView = DataEntryView().chain.bgColor(.clear).component
    private let valueEntryView = DataEntryView().chain.bgColor(.clear).component
    private let dateEntryView = DataEntryView().chain.bgColor(.clear).component
    private let doneButton = UIButton().chain.bgColor(.dataEntryViewBackground).cornerRadius(6).title("Done").titleColor(.doneButtonTitile).font(.buttonBoldTitle).component
    
    override func config() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    override func createViews() {
        categoryEntryView.placeholderText = "#Category"
        categoryEntryView.isHideCurrencyLabel = true
        categoryEntryView.textFieldKeyboadType = .default
        
        valueEntryView.placeholderText = "0.00"
        valueEntryView.isHideCurrencyLabel = false
        valueEntryView.textFieldKeyboadType = .decimalPad
        
        dateEntryView.placeholderText = getCurrentDateAndTime()
        dateEntryView.isHideCurrencyLabel = true
        dateEntryView.textFieldKeyboadType = .default
        
        
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(mainSV)
        mainSV.activateLayouts([.leading: 16, .traling: -16])
        mainSV.chain.addArrangeSubViews([categoryEntryView, valueEntryView, dateEntryView, doneButton])
        mainSV.setCustomSpacing(70, after: dateEntryView)
        
        doneButton.activateLayouts([.height: 55])
    }
    
    private func getCurrentDateAndTime() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
         
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "d MMM, h:mm a"
        return dateFormatter.string(from: date)
    }
}

//
//  NewEntryTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/29/20.
//

import Foundation
import RxSwift

class NewEntryTVCell: NewEntryBaseTVCell {
    var didTapDoneButton: PublishSubject<NewEntryRealmModel>!
    
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
        dateEntryView.isUserInteractionEnabled = false
    }
    
    override func prepareForReuse() {
        doneButton.rx.tap
            .map { [weak self] in
                guard let `self` = self else { return NewEntryRealmModel() }
                let hashcategoryModel = HashCategoryRealmModel()
                let monthModel = MonthRealmModel()
                let value = self.valueEntryView.textField.text?.price
                let date = self.dateEntryView.textField.text ?? ""
                
                let newEntryModel = NewEntryRealmModel()
                newEntryModel.monthId = monthModel
                newEntryModel.hashCategory = hashcategoryModel
                newEntryModel.value = value ?? 0.00
                newEntryModel.date = date
                return newEntryModel
            }
            .bind(to: didTapDoneButton)
            .disposed(by: rx.disposeBag)
    }
}

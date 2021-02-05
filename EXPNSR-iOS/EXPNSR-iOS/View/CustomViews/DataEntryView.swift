//
//  DataEntryView.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/29/20.
//

import Foundation
import MNkSupportUtilities

class DataEntryView: MNkView {
    private let containerView = UIView().chain.bgColor(.dataEntryViewBackground).cornerRadius(6).component
    private let mainSV = UIStackView().chain.hStack.spacing(4).component
    let textField = UITextField().chain.bgColor(.clear).textAligment(.left).font(.dataEntryViewBoldTextField).textColor(.dataEntryViewtextFieldTextColor).component
    private let currencyLabel = UILabel().chain.bgColor(.clear).textAlignment(.right).font(.dataEntryViewBoldTextField).textColor(.dataEntryViewCurrencyTextColor).text(Genaric().getCurrencyCodeForLocale().uppercased()).component
    
    var placeholderText: String = "" {
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    var isHideCurrencyLabel: Bool = true {
        didSet {
            currencyLabel.isHidden = isHideCurrencyLabel
        }
    }
    
    var textFieldKeyboadType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = textFieldKeyboadType
        }
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(containerView)
        containerView.activateLayouts()
        
        containerView.addSubview(mainSV)
        mainSV.activateLayouts([.top: 14, .bottom: -14, .leading: 20, .traling: -20])
        
        mainSV.chain.addArrangeSubViews([textField, currencyLabel])
        currencyLabel.activateLayouts([.width: 70])
    }
}

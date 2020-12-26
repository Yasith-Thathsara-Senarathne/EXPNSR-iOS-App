//
//  TotalExpensesTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import MNkSupportUtilities
import Action

class TotalExpensesTVCell: MNkTVCell_Parameter<Double> {
    private let containerView = UIView().chain.bgColor(.dataEntryViewBackground).cornerRadius(8).component
    private let mainSV = UIStackView().chain.vStack.spacing(4).component
    private let currencyLabel = UILabel().chain.bgColor(.clear).textAlignment(.center).font(.homeCurrencyTitle).textColor(.homeExpenseCellTextColor).text(Genaric().getCurrencyCodeForLocale().uppercased()).component
    private let totalExpensesLabel = UILabel().chain.bgColor(.clear).textAlignment(.center).font(.homeTotalExpenseValueTitle).textColor(.homeExpenseCellTextColor).text("15050.00").component
    private let totalExpensesTextLabel = UILabel().chain.bgColor(.clear).textAlignment(.center).font(.homeMonthlyTotalTitle).textColor(.homeExpenseCellTextColor).text("Total Expenses".uppercased()).component
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(containerView)
        containerView.activateLayouts([.leading: 24, .traling: -24])
        
        containerView.addSubview(mainSV)
        mainSV.activateLayouts([.top: 30, .bottom: -30, .leading: 10, .traling: -10])
        
        mainSV.chain.addArrangeSubViews([currencyLabel, totalExpensesLabel, totalExpensesTextLabel])
    }
    
    override func updateUI(with data: Double) {
        totalExpensesLabel.chain.text(data.stringWithDoubDecimalPlace())
    }
}

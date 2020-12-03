//
//  DateSelectionCVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import MNkSupportUtilities
import Action

class MonthSelectionCVCell: MNkCVCell_Parameter<MonthModel> {
    private let monthLable = UILabel().chain.textColor(.monthUnselectedTextColor).font(.monthSelectedTitle).textAlignment(.center).component
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(monthLable)
        monthLable.activateLayouts()
    }
    
    override func updateUI(with data: MonthModel) {
        let currentMonth: MonthModel = MonthModel(id: Genaric().getCurrentDateAndTime(type: .dateAsId), title: Genaric().getCurrentDateAndTime(type: .yearWithMonth))
        let isCurrentMonth: Bool = data.id == currentMonth.id
        let font: UIFont = isCurrentMonth ? .monthSelectedTitle : .monthUnselectedTitle
        let textColor: UIColor = isCurrentMonth ? .monthSelectedTextColor : .monthUnselectedTextColor
        let text = data.title
        monthLable.chain.textColor(textColor).font(font).text(text)
    }
}

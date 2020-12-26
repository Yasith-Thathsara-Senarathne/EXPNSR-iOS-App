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
    
    var isCellSelected: Bool = false {
        didSet {
            checkForSelectedCell(with: isCellSelected)
        }
    }
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(monthLable)
        monthLable.activateLayouts()
    }
    
    override func updateUI(with data: MonthModel) {
        monthLable.chain.text(data.title)
    }
    
    private func checkForSelectedCell(with isSelected: Bool) {
        let font: UIFont = isSelected ? .monthSelectedTitle : .monthUnselectedTitle
        let textColor: UIColor = isSelected ? .monthSelectedTextColor : .monthUnselectedTextColor
        monthLable.chain.textColor(textColor).font(font)
    }
}

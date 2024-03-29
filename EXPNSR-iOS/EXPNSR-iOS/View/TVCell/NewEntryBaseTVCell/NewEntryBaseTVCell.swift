//
//  NewEntryBaseTVCell.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import MNkSupportUtilities
import Action

class NewEntryBaseTVCell: MNkTableViewCell {
    let mainSV = UIStackView().chain.vStack.spacing(12).component
    let categoryEntryView = DataEntryView().chain.bgColor(.clear).component
    let valueEntryView = DataEntryView().chain.bgColor(.clear).component
    let dateEntryView = DataEntryView().chain.bgColor(.clear).component
    let doneButton = UIButton().chain.bgColor(.dataEntryViewBackground).cornerRadius(6).title("Done").titleColor(.doneButtonTitile).font(.buttonBoldTitle).component
    
    override func config() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(mainSV)
        mainSV.activateLayouts([.leading: 16, .traling: -16])
        mainSV.chain.addArrangeSubViews([categoryEntryView, valueEntryView, dateEntryView, doneButton])
        mainSV.setCustomSpacing(70, after: dateEntryView)
        
        doneButton.activateLayouts([.height: 55])
    }
}

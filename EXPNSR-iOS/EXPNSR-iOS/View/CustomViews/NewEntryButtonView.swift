//
//  NewEntryButtonView.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import MNkSupportUtilities

class NewEntryButtonView: MNkView {
    private let newEntryButton = UIButton().chain.bgColor(.newEntryButtonBackground).clipToBounds(true).cornerRadius(35).border(.newEntryButtonBorder, 0.5).setImage(.tabBarNewEntry).component
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(newEntryButton)
        newEntryButton.activateLayouts()
    }
}

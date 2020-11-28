//
//  CustomNavigationBar.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/28/20.
//

import Foundation
import MNkSupportUtilities

class CustomNavigationBar: MNkView {
    private let titleLabel = UILabel().chain.font(.largeBoldTitle).textColor(.largeBoldTitle).textAlignment(.left).component
    let closeButton = UIButton().chain.bgColor(.clear).clipToBounds(true).tintColor(.closeButtonTint).setImage(.close).imageEdgeInsets(.init(top: 10, left: 12, bottom: 10, right: 12)).component
    private let mainSV = UIStackView().chain.hStack.spacing(4).distribution(.fill).component
    
    var titleText: String! {
        didSet {
            titleLabel.chain.text(titleText)
        }
    }
    
    var isCloseButtonHidden: Bool! {
        didSet {
            closeButton.isHidden = isCloseButtonHidden
        }
    }
    
    override func insertAndLayoutSubviews() {
        mainSV.chain.addArrangeSubViews([titleLabel, closeButton])
        closeButton.activateLayouts([.centerY: 0])
        
        addSubview(mainSV)
        mainSV.activateLayouts()
    }
}

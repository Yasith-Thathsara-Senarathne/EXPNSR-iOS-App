//
//  UIFont+Name+Extension.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/28/20.
//

import Foundation
import UIKit.UIFont

extension UIFont {
    class var largeBoldTitle: UIFont {
        return AppFont.font(with: .bold, size: 38)
    }
    
    class var dataEntryViewBoldTextField: UIFont {
        return AppFont.font(with: .bold, size: 30)
    }
    
    class var buttonBoldTitle: UIFont {
        return AppFont.font(with: .bold, size: 25)
    }
}

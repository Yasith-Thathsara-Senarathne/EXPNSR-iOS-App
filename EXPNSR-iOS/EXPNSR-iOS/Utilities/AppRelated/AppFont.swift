//
//  AppFont.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/28/20.
//

import Foundation
import UIKit.UIFont

struct AppFont {
    static func font(with name: FontName = .regular,size: CGFloat)->UIFont {
        return UIFont(name: name.value, size: size)!
    }
    
    enum FontName: String {
        case light = "Montserrat-Light"
        case regular = "Montserrat-Regular"
        case medium = "Montserrat-Medium"
        case semiBold = "Montserrat-SemiBold"
        case bold = "Montserrat-Bold"
        
        var value: String {
            self.rawValue
        }
    }
}

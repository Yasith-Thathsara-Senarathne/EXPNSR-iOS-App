//
//  UITabBarController+Extension.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit.UITabBarController

extension UITabBarController {
    func setTabBarHidden(_ isHidden: Bool, animated: Bool, completion: (() -> Void)? = nil ) {
        
        guard #available(iOS 14, *) else {
            guard isTabBarHidden != isHidden else{
                completion?()
                return
            }
            
            let height = tabBar.frame.size.height + 25
            let duration = (animated ? 0.2 : 0.0)
            let translation = isHidden ? CGAffineTransform.init(translationX: 0, y: height) : .identity
            
            UIView.animate(withDuration: duration, animations: {
                self.tabBar.transform = translation
                self.view.setNeedsDisplay()
                self.view.layoutIfNeeded()
            }) { _ in
                completion?()
            }
            return
        }
        
        let duration = (animated ? 0.2 : 0.0)
        
        UIView.animate(withDuration: duration, animations: {
            self.tabBar.isHidden = isHidden
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
    
    var isTabBarHidden: Bool {
        return self.tabBar.frame.origin.y >= UIScreen.main.bounds.height
    }
}

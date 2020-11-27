//
//  UIScrollView+Chain.swift
//  iDak
//
//  Created by Malith Nadeeshan on 6/10/20.
//  Copyright © 2020 Malith Nadeeshan. All rights reserved.
//
import UIKit

extension UIKitChain where Component : UIScrollView {
    @discardableResult
    public func showScollIndicators(_ isShow:Bool) -> Self {
        component.showsVerticalScrollIndicator = isShow
        component.showsHorizontalScrollIndicator = isShow
        return self
    }
    
    @discardableResult
    public func setScrollIndicatorInset(_ inset: UIEdgeInsets) -> Self {
        component.scrollIndicatorInsets = inset
        return self
    }
    
    @discardableResult
    public func contentInsetAdjustmentBehavior(_ behavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        component.contentInsetAdjustmentBehavior = behavior
        return self
    }
    
    @discardableResult
    public func contentInset(_ inset: UIEdgeInsets) -> Self {
        component.contentInset = .init(top: 0, left: 0, bottom: 20, right: 0)
        return self
    }
}

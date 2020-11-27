//
//  TabBarViewController.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Action

class TabBarViewController: UITabBarController {
    
    // Class properties
    private let newEntryButtonView = NewEntryButtonView().chain.component
    
    var didSelectTab: Action<UIViewController, Void>!
    
    func prepareTabs(_ viewControllers: [UIViewController]) {
        viewControllers.enumerated().forEach {
            switch $0.offset {
            case 0:
                $0.element.tabBarItem = .init(title: "", image: .tabBarHome, tag: $0.offset)
                
            case 1:
                $0.element.tabBarItem = .init(title: "", image: UIImage(), tag: $0.offset)
                $0.element.tabBarItem.isEnabled = false
                
            case 2:
                $0.element.tabBarItem = .init(title: "", image: .tabBarProfile, tag: $0.offset)
                
            default:
                break
            }
        }
        self.setViewControllers(viewControllers, animated: false)
    }
    
    func bind() {
        rx.didSelect
            .bind(to: didSelectTab.inputs)
            .disposed(by: rx.disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .tabBarTint
        tabBar.barTintColor = .tabBarBackground
        tabBar.isTranslucent = false
        
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        newEntryButtonView.frame = CGRect(x: (view.bounds.width / 2)-35, y: -25, width: 70, height: 70)
        tabBar.addSubview(newEntryButtonView)
        view.layoutIfNeeded()
    }
}

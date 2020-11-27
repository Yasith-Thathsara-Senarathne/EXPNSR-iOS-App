//
//  AppDelegate.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public lazy var window:UIWindow? = UIWindow.init(frame: UIScreen.main.bounds)
    public var initCoordinator: Coordinator!
    public lazy var rootRouter = AppDelegateRouter.init(self.window!)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initCoordinator = TabBarCoordinator.init(rootRouter)
        initCoordinator.coordinate(animated: true,nil)
        setKeyBoardManagerConfig()
        
        return true
    }
}

//MARK:- AppDelegate Other Function
extension AppDelegate {
    private func setKeyBoardManagerConfig(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardAppearance = .dark
        IQKeyboardManager.shared.overrideKeyboardAppearance = true
//        IQKeyboardManager.shared.toolbarTintColor = .lightWhite
//        IQKeyboardManager.shared.toolbarBarTintColor = .lightErieBlack
    }
}

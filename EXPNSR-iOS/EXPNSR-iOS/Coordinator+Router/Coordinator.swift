//
//  Coordinator.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import UIKit
import RxSwift
import Action

public protocol Coordinator: class {
    var children:[Coordinator]{get set}
    var router:Router { get }
    
    func coordinate(animated:Bool, _ action: CocoaAction?)
    func dismiss(animated:Bool)
    func coordinateChild(_ child:Coordinator, animated:Bool)
}

//MARK:- Router
extension Coordinator{
    public func dismiss(animated: Bool){
        router.dismiss(animated: animated)
    }
    
    public func coordinateChild(_ child: Coordinator, animated: Bool){
        children.append(child)
        
        child.coordinate(animated: animated, CocoaAction{ [weak child, weak self] in
            print("Coordinate action performed")
            guard let `self` = self,
                  let `child` = child else { return .empty() }
            self.removeChild(child)
            return .empty()
        })
        
    }
    
    private func removeChild(_ child: Coordinator){
        guard let index = children.firstIndex(where:{
            $0 === child
        }) else{return}
        
        children.remove(at: index)
    }
}

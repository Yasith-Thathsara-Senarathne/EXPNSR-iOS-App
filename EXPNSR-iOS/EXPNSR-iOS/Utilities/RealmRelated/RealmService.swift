//
//  RealmService.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation
import RealmSwift

protocol RealmService {}

extension RealmService {
    func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T? {
      do {
        let realm = try Realm()
        return try action(realm)
      } catch let err {
        print("Failed \(operation) realm with error: \(err)")
        return nil
      }
    }
}

import RxSwift
extension RealmService {
    func withObservableRealm<T>(_ operation: String, action: @escaping (Realm) throws -> T) -> Observable<T> {
        Observable<T>.create { observer in
            do {
                let realm = try Realm()
                let operation = try action(realm)
                observer.onNext(operation)
                observer.onCompleted()
                
            } catch let error {
                observer.onError(AppError.normal(description: "Failed \(operation) realm with error: \(error)"))
            }
            return Disposables.create()
        }
    }
}

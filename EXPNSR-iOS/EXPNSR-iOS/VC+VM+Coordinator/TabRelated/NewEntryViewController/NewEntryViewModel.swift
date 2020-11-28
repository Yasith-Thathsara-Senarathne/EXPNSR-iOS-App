//
//  NewEntryViewModel.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 11/27/20.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources
import RealmSwift

protocol NewEntryViewModelType {
    var didTapCloseButton: CocoaAction! { get }
}

struct NewEntryViewModel: NewEntryViewModelType {
    var didTapCloseButton: CocoaAction!
}

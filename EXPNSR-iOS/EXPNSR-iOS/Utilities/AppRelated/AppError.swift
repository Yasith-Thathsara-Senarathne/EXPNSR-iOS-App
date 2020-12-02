//
//  AppError.swift
//  EXPNSR-iOS
//
//  Created by Thathsara Senarathne on 12/2/20.
//

import Foundation

enum AppError: Error {
    case normal(description: String)
    
    var localizedDescription: String {
        switch self {
        case let .normal(description: error):
            return error
        }
    }
}

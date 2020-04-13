//
//  ErrorResult.swift
//  GLI
//
//  Created by Avendi Sianipar on 10/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

protocol ErrorResult: Error {
    var description: String { get }
}

enum ErrorType: ErrorResult {
    case parserError, emptyResult

    var description: String {
        switch self {
        case .emptyResult:
            return "Response Empty. Please scroll down to refresh data."
        case .parserError:
            return "Error when parsing response to model."
        }
    }
}

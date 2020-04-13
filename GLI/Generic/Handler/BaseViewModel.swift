//
//  BaseViewModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 10/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Moya

class BaseViewModel {
    
    let isLoading = ObservableData<Bool>()
    let errorMsgValidation = ObservableData<String>()
    
    func debugPrintResponse(_ response: Response) {
        do {
            let json = try response.mapJSON()
            print(json)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func handleError(_ error: Error) {
        switch error {
        case ErrorType.emptyResult:
            errorMsgValidation.value = ErrorType.emptyResult.description
        case ErrorType.parserError:
            errorMsgValidation.value = ErrorType.parserError.description
        default:
            errorMsgValidation.value = error.localizedDescription
        }
    }
}

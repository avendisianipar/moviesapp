//
//  ResponseHandler.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

class ResponseHandler {
    static func getResponse<T : Decodable> (data: Data) -> T? {
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}

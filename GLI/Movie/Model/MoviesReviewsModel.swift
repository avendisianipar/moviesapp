//
//  MoviesReviewsModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

struct MoviesReviewsModel: Decodable {
    let id: Int
    let page: Int
    var results: [MoviesReviewsDetailModel]?
}

struct MoviesReviewsDetailModel: Decodable {
    let id: String
    let author: String
    let content: String
    let url: String
}

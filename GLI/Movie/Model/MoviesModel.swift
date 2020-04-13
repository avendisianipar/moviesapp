//
//  MoviesModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

struct MoviesModel: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    var results: [MoviesResultsModel]
    
}

struct MoviesResultsModel: Decodable {
    let id: Int
    let title: String?
    let release_date: String?
    let overview: String?
    let backdrop_path: String?
    let poster_path: String?
    let vote_average: Double?
    
    private(set) lazy var posterPathImage: ImagePath? = {
        guard let posterPath = self.poster_path else { return nil }
        return ImagePath.poster(path: posterPath)
    }()
}

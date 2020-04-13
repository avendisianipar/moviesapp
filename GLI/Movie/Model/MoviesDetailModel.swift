//
//  MoviesDetailModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

struct MoviesDetailModel: Decodable {
    var id: Int?
    var title: String?
    var runtime: Int?
    var overview: String?
    var backdropPath: String?
    var videos: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case backdropPath = "backdrop_path"
        case id, overview, runtime, videos, results
    }
    
    private(set) lazy var backdropPathImage: ImagePath? = {
        guard let backdropPath = self.backdropPath else { return nil }
        return ImagePath.poster(path: backdropPath)
    }()
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        videos = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .videos).decodeIfPresent([Video].self, forKey: .results)
    }
}

//
//  MoviesConfigModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

public struct MoviesConfigModel: Decodable {
    
    let imagesBaseURLString: String
    let imagesSecureBaseURLString: String
    let backdropSizes: [String]
    let logoSizes: [String]
    let posterSizes: [String]
    let profileSizes: [String]
    let stillSizes: [String]
    
    enum CodingKeys: String, CodingKey {
        case images
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self).nestedContainer(keyedBy: CodingKeys.self, forKey: .images)
        self.imagesBaseURLString = try container.decode(String.self, forKey: .baseURL)
        self.imagesSecureBaseURLString = try container.decode(String.self, forKey: .secureBaseURL)
        self.backdropSizes = try container.decode([String].self, forKey: .backdropSizes)
        self.logoSizes = try container.decode([String].self, forKey: .logSizes)
        self.posterSizes = try container.decode([String].self, forKey: .posterSizes)
        self.profileSizes = try container.decode([String].self, forKey: .profileSizes)
        self.stillSizes = try container.decode([String].self, forKey: .stillSizes)
    }
}

//
//  MoviesCreditModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

struct MoviesCreditModel: Decodable {
    let id: Int
    var cast: [MoviesCreditDetailModel]?
    var crew: [MoviesCreditDetailModel]?
}

struct MoviesCreditDetailModel: Decodable {
    var id: Int?
    var name: String?
    var job: String?
    var character: String?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, job, character
        case profilePath = "profile_path"
    }
    
    private(set) lazy var profilePathImage: ImagePath? = {
        guard let profilePath = self.profilePath else { return nil }
        return ImagePath.poster(path: profilePath)
    }()
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        job = try container.decodeIfPresent(String.self, forKey: .job)
        character = try container.decodeIfPresent(String.self, forKey: .character)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
    }
}

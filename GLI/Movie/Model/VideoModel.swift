//
//  VideoModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    let id: String
    let key: String
    let name: String
    
    var youtubeURL: URL? { return URL(string: "https://www.youtube.com/watch?v=\(self.key)") }
    var youtubeThumbnailURL: URL? { return URL(string: "https://img.youtube.com/vi/\(self.key)/0.jpg") }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
    }
    
    init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        key = try container.decode(String.self, forKey: .key)
        name = try container.decode(String.self, forKey: .name)
    }
}

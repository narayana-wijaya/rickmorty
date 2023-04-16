//
//  EpisodeModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

struct EpisodeModel: Decodable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

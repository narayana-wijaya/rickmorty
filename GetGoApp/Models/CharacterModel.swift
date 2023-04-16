//
//  CharacterModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import Foundation

// MARK: - ResponseMessage
struct ResponseModel<T: Decodable>: Decodable {
    let info: Info
    let results: T?
}

// MARK: - Info
struct Info: Decodable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Character: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}

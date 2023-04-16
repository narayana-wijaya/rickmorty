//
//  CharacterServiceMock.swift
//  GetGoAppTests
//
//  Created by Narayana Wijaya on 14/04/23.
//

import Foundation
@testable import GetGoApp

class CharacterServiceMock: CharacterServiceProtocol {
    func getCharacterList(endpoint: String?, filter: Filter, completion: @escaping (ResponseModel<[Character]>) -> Void, onError: @escaping ((ErrorRequest) -> Void)) {
        let info: Info = Info(count: 1, pages: 1, next: "https://rickandmortyapi.com/api/character?page=2", prev: nil)
        let loc = Location(name: "My Location", url: "")
        let result = [
            Character(id: 1, name: "Character 1", status: "", species: "", type: "", gender: "", origin: loc, location: loc, image: "", episode: [""], url: "", created: ""),
            Character(id: 2, name: "Character 2", status: "", species: "", type: "", gender: "", origin: loc, location: loc, image: "", episode: [""], url: "", created: ""),
            Character(id: 3, name: "Character 3", status: "", species: "", type: "", gender: "", origin: loc, location: loc, image: "", episode: [""], url: "", created: "")
        ]
        let mockResponse: ResponseModel<[Character]> = ResponseModel(info: info, results: result)
        
        completion(mockResponse)
    }
}

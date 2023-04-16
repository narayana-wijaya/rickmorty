//
//  CharacterService.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import Foundation

class CharacterService: CharacterServiceProtocol {
    func getCharacterList(endpoint: String?, filter: Filter, completion: @escaping (ResponseModel<[Character]>) -> Void, onError: @escaping ((ErrorRequest) -> Void)) {

        // need to be encoded for case query with space exp: mythological creature
        let encodedEndpoint = endpoint?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url: URL = endpoint != nil ? URL(string: encodedEndpoint!)! :
        baseUrl
            .appending(path: Endpoint.character.path)
            .appending(queryItems: filter.toQueryItem())

        NetworkRequest.shared.request(url: url, model: ResponseModel<[Character]>.self) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                onError(error)
            }
        }
    }
}

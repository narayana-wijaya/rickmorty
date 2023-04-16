//
//  ServiceProtocol.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import Foundation

protocol NetworkRequestProtocol {
    func request<Model: Decodable>(url: URL, model: Model.Type, completion: @escaping (Result<Model, ErrorRequest>) -> Void)
}

protocol CharacterServiceProtocol {
    func getCharacterList(endpoint: String?, filter: Filter, completion: @escaping (ResponseModel<[Character]>) -> Void, onError: @escaping ((ErrorRequest) -> Void))
}

protocol LocationServiceProtocol {
    func getLocationList(endpoint: String?, search name: String, completion: @escaping (ResponseModel<[LocationModel]>) -> Void, onError: @escaping ((ErrorRequest) -> Void))
}

protocol EpisodeServiceProtocol {
    func getEpisodeList(endpoint: String?, search name: String, completion: @escaping (ResponseModel<[EpisodeModel]>) -> Void, onError: @escaping ((ErrorRequest) -> Void))
}

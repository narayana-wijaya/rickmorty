//
//  LocationService.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class LocationService: LocationServiceProtocol {
    func getLocationList(endpoint: String?, search name: String, completion: @escaping (ResponseModel<[LocationModel]>) -> Void, onError: @escaping ((ErrorRequest) -> Void)) {
        let encodedEndpoint = endpoint?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url: URL = endpoint != nil ? URL(string: encodedEndpoint!)! :
        baseUrl
            .appending(path: Endpoint.location.path)
            .appending(queryItems: [URLQueryItem(name: "name", value: name)])

        NetworkRequest.shared.request(url: url, model: ResponseModel<[LocationModel]>.self) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                onError(error)
            }
        }
    }
}

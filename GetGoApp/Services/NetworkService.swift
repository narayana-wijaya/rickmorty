//
//  NetworkService.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import Foundation

let baseUrl = URL(string: "https://rickandmortyapi.com/api/")!

class NetworkRequest: NetworkRequestProtocol {
    static let shared: NetworkRequestProtocol = NetworkRequest()
    
    func request<Model: Decodable>(url: URL, model: Model.Type, completion: @escaping (Result<Model, ErrorRequest>) -> Void) {
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? ErrorRequest {
                print(error)
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            if let model = try? JSONDecoder().decode(Model.self, from: data) {
                print(model)
                completion(.success(model))
            } else {
                completion(.failure(.jsonError))
            }
        }
        
        task.resume()
    }
    
}


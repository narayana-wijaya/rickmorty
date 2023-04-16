//
//  NetworkServiceEnum.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 11/04/23.
//

import Foundation

enum Endpoint: String {
    case character
    case location
    case episode
    
    var path: String {
        return rawValue
    }
}

enum ErrorRequest: Error {
    case noInternet
    case unknown
    case jsonError
}

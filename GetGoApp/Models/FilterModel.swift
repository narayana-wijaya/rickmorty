//
//  FilterModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 12/04/23.
//

import Foundation

struct Filter {
    var name: String?
    var status: CharacterStatus?
    var gender: Gender?
    var species: Species?
    
    func toQueryItem() -> [URLQueryItem] {
        var query = [URLQueryItem]()
        if let name = name {
            query.append(URLQueryItem(name: "name", value: name))
        }
        if let status = status {
            query.append(URLQueryItem(name: "status", value: status.rawValue))
        }
        if let gender = gender {
            query.append(URLQueryItem(name: "gender", value: gender.rawValue))
        }
        if let species = species {
            query.append(URLQueryItem(name: "species", value: species.rawValue))
        }
        return query
    }
}

enum CharacterStatus: String, CaseIterable {
    case alive, dead, unknown
}

enum Gender: String, CaseIterable {
    case male, female, genderless, unknown
}

enum Species: String, CaseIterable {
    case alien, animal, mythological = "mythological creature", human
}

//
//  CharacterViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class CharacterViewModel {
    var character: Character
    
    init(_ character: Character) {
        self.character = character
    }
    
    var dateFormatted: String {
        let formatter = CustomDateFormatter()
        return formatter.transformDate(character.created, to: "HH:mm, MMMM yyyy")
    }
}

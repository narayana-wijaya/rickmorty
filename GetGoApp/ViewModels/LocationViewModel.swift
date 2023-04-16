//
//  LocationViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class LocationViewModel {
    var location: LocationModel
    
    init(_ location: LocationModel) {
        self.location = location
    }
    
    var dateFormatted: String {
        let formatter = CustomDateFormatter()
        return formatter.transformDate(location.created)
    }
}

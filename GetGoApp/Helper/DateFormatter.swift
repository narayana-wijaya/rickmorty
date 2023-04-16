//
//  DateFormatter.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation

class CustomDateFormatter {
    let formatter = DateFormatter()
    
    func transformDate(_ input: String,
                       from apiFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                       to displayFormat: String = "HH:mm, dd MMMM yyyy") -> String {
        guard let date = getDate(from: input, with: apiFormat) else { return "date format is not support"}
        
        formatter.dateFormat = displayFormat
        return formatter.string(from: date)
    }
    
    private func getDate(from dateString: String, with format: String) -> Date? {
        formatter.dateFormat = format
        
        return formatter.date(from: dateString)
    }
}

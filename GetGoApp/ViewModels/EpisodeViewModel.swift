//
//  EpisodeViewModel.swift
//  GetGoApp
//
//  Created by Narayana Wijaya on 13/04/23.
//

import Foundation
import RegexBuilder

class EpisodeViewModel {
    var item: EpisodeModel
    
    init(_ item: EpisodeModel) {
        self.item = item
    }
    
    var dateFormatted: String {
        let formatter = CustomDateFormatter()
        return formatter.transformDate(item.created)
    }
    
    var season: Int {
        return getSeasonNumber().season
    }
    
    var episode: Int {
        return getSeasonNumber().episode
    }
    
    var airDate: String {
        let formatter = CustomDateFormatter()
        return formatter.transformDate(item.airDate, from: "MMMM d, yyyy", to: "d MMMM yyyy")
    }
    
    private func getSeasonNumber() -> (season: Int, episode: Int) {
        let regex = Regex {
            "S"
            Capture(OneOrMore(.digit))
            "E"
            Capture(OneOrMore(.digit))
        }
        
        if let result = item.episode.wholeMatch(of: regex) {
            let season = Int(result.1.description) ?? 0
            let episode = Int(result.2.description) ?? 0
            return (season: season, episode: episode)
        }
        return (season: 0, episode: 0)
    }
}

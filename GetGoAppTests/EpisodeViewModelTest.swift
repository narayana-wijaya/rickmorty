//
//  EpisodeViewModelTest.swift
//  GetGoAppTests
//
//  Created by Narayana Wijaya on 15/04/23.
//

import Foundation
import XCTest
@testable import GetGoApp

class EpisodeViewModelTest: XCTest {
    var sut: EpisodeViewModel!
    
    override func setUp() {
        let ep = EpisodeModel(id: 1, name: "Episode 1", airDate: "December 2, 2013", episode: "S01E15", characters: [], url: "", created: "")
        sut = EpisodeViewModel(ep)
    }
    
    func test_getEpisode_returnValidInteger() {
        XCTAssertEqual(sut.season, 1)
        XCTAssertEqual(sut.episode, 15)
    }
    
    func test_getAirDate_returnTheRightFormat() {
        XCTAssertEqual(sut.airDate, "2 December 2013")
    }
}

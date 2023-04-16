//
//  CharacterListViewModelTest.swift
//  GetGoAppTests
//
//  Created by Narayana Wijaya on 14/04/23.
//

@testable import GetGoApp
import XCTest

class CharacterListViewModelTest: XCTestCase {
    var sut: CharacterListViewModel!
    
    override func setUp() {
        let service = CharacterServiceMock()
        sut = CharacterListViewModel(service: service)
    }
    
    func test_getData_listIsNotEmpty() {
        sut.getData()
        
        XCTAssertFalse(sut.results.isEmpty)
    }
    
    func test_loadMore_listCountIsIncrease() {
        sut.getData()
        let firstCount = sut.results.count
        sut.loadMore()
        
        XCTAssertEqual(sut.results.count, 6)
        XCTAssertNotEqual(firstCount, sut.results.count)
    }
    
    func test_search_listIsReset() {
        sut.getData()
        sut.loadMore()
        
        let firstCount = sut.results.count
        
        sut.search("name")
        XCTAssertEqual(sut.results.count, 3)
        XCTAssertNotEqual(firstCount, sut.results.count)
    }
    
    func test_filter_listIsReset() {
        sut.getData()
        sut.loadMore()
        
        let firstCount = sut.results.count
        
        sut.setFilter(Filter(status: .dead))
        XCTAssertEqual(sut.results.count, 3)
        XCTAssertNotEqual(firstCount, sut.results.count)
    }
}

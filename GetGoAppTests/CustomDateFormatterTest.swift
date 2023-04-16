//
//  CustomDateFormatterTest.swift
//  GetGoAppTests
//
//  Created by Narayana Wijaya on 14/04/23.
//


@testable import GetGoApp
import XCTest

class CustomDateFormatterTest: XCTest {
    var sut: CustomDateFormatter!
    
    override func setUp() {
        sut = CustomDateFormatter()
    }
    
    func test_defaultFormat_returnDateWithDefaultFormat() {
        let date = "2017-11-10T12:56:33.798Z"
        
        let result = sut.transformDate(date)
        
        XCTAssertEqual(result, "12:33, 10 November 2017")
    }
    
    func test_defaultFormat_inputNewFormat() {
        let date = "2017-11-10T12:56:33.798Z"
        
        let result = sut.transformDate(date, to: "dd MM YYYY")
        
        XCTAssertEqual(result, "10 11 2017")
    }
    
    func test_inputFormat_inputNewFormat() {
        let date = "12:33, 10 November 2017"
        
        let result = sut.transformDate(date,from: "HH:mm, dd MMMM yyyy", to: "dd-MM-YYYY")
        
        XCTAssertEqual(result, "10-11-2017")
    }
    
    func test_wrongInputFormat_returnNotEqual() {
        let date = "2017-11-10T12:56:33.798Z"
        
        let result = sut.transformDate(date,from: "HH:mm, dd MMMM yyyy", to: "dd-MM-YYYY")
        
        XCTAssertNotEqual(result, "10-11-2017")
    }
}

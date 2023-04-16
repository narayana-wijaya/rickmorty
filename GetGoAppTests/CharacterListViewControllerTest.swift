//
//  CharacterListViewControllerTest.swift
//  GetGoAppTests
//
//  Created by Narayana Wijaya on 15/04/23.
//

import Foundation
import XCTest
@testable import GetGoApp

class CharacterListViewControllerTest: XCTest {
    var sut: CharacterListViewController!
    
    override func setUp() {
        sut = CharacterListViewController()
        sut.loadViewIfNeeded()
    }
    
    func test_viewDidLoad_searchFieldIsExist() {
        XCTAssertNotNil(sut.searchController)
    }
    
    func test_viewDidLoad_filterButtonIsExist() {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func test_tapFilterButton_willDisplayFilterView() {
        sut.filterButtonDidTapped()
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let topController = keyWindow?.rootViewController
        let presentedVC = topController?.presentedViewController
        XCTAssertFalse(presentedVC is EpisodeDetailViewController)
        XCTAssertTrue(presentedVC is FilterViewController)
    }
}

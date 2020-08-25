//
//  RouteTests.swift
//  TheIconTests
//
//  Created by Brena Amorim on 24/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import XCTest
@testable import TheIcon

class RouteTests: XCTestCase {
    let term = "Dog"
    
    func test_route_searchIcon() {
    let url = "https://api.thenounproject.com/icons/\(term)"
    let expect = expectation(description: "Searching dog icon")
    let urlSearch = IconsAPI(route: .searchIcons(term: term))
        XCTAssertEqual(url, urlSearch.url)
    expect.fulfill()
    //Async
    
    wait(for: [expect], timeout: 5)
    }
}

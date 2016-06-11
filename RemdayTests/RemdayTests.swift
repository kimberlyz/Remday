//
//  RemdayTests.swift
//  RemdayTests
//
//  Created by Kimberly Zai on 6/8/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import XCTest
@testable import Remday

class RemdayTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Birthday initializer returns when no name is provided
    func testBirthdayInitialization() {
        // Success case.
        let potentialItem = Birthday(name: "Newest meal", photo: nil, dateAsString: "2016-11-4")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Birthday(name: "", photo: nil, dateAsString: "2014-8-1")
        XCTAssertNil(noName, "Empty name is invalid")
    }
}

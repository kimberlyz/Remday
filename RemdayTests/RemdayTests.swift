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
        //let potentialItem = Birthday(name: "Newest meal", photo: nil, dateAsString: "2016-11-4")
        let potentialItem = Birthday(name: "Newest meal", photo: nil, month: "Jan", day: "2", year: "2010")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        //let noName = Birthday(name: "", photo: nil, dateAsString: "2014-8-1")
        let noName = Birthday(name: "", photo: nil, month: "Feb", day: "3", year: "2000")
        XCTAssertNil(noName, "Empty name is invalid")
    }
}

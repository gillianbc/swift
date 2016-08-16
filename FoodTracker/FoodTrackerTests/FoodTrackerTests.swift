//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by test on 08/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitializationSuccess() {
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
    }
    
    func testMealInitializationEmptyName(){
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
    }
    
    func testMealInitializationBadRating(){
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative rating not allowed")
    }

    
}

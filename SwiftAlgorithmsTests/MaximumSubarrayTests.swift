//
//  MaximumSubarrayTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 7/18/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class MaximumSubarrayTests: XCTestCase {
    let maxSub = MaximumSubarray()
    
    override func setUpWithError() throws {
        
    }
    
    func testExample() throws {
        let arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        XCTAssertEqual(maxSub.find(arr), 6)
    }
    
    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}

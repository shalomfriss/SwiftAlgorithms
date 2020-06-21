//
//  BinaryTreeNodeTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 6/21/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class BinaryTreeNodeTests: XCTestCase {
    let tree = BinaryTreeNode(aValue: 50)
    
    override func setUpWithError() throws {
        tree.insert(newValue: 1)
        tree.insert(newValue: 100)
        tree.insert(newValue: 2)
        tree.insert(newValue: 99)
        tree.insert(newValue: 3)
        tree.insert(newValue: 1)
        tree.insert(newValue: 1)
        tree.insert(newValue: 1)
        tree.insert(newValue: 1)
        tree.insert(newValue: 1)
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

}

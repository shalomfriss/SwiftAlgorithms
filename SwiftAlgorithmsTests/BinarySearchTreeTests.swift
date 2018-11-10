//
//  BinarySearchTreeTests.swift
//  SwiftAlgorithmsTests
//
//  Created by user on 11/3/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class BinarySearchTreeTests: XCTestCase {
    
    var tree = BinarySearchTree<Int>(value: 7)
    
    override func setUp() {
        tree = BinarySearchTree<Int>(value: 7)
        tree.insert(value: 5)
        tree.insert(value: 10)
        tree.insert(value: 1)
        tree.insert(value: 9)
    }
    
    override func tearDown() {
        
    }
    
    func testMinAndMax() {
        XCTAssert(tree.maximum() == 10)
        XCTAssert(tree.minimum() == 1)
    }
    
    func testInsertion() {
        
        tree = BinarySearchTree<Int>(value: 7)
        XCTAssertEqual(tree.height(), 0)
        
        tree.insert(value: 5)
        XCTAssertEqual(tree.height(), 1)
        
        tree.insert(value: 10)
        XCTAssertEqual(tree.height(), 1)
        
        tree.insert(value: 1)
        XCTAssertEqual(tree.height(), 2)
        
        tree.insert(value: 9)
        XCTAssertEqual(tree.height(), 2)
        
        XCTAssert(tree.maximum() == 10)
        XCTAssert(tree.minimum() == 1)
        XCTAssert(tree.height() == 2)
        XCTAssertEqual(tree.toArray(), [1,5,7,9,10])
        
        
        var res = tree.search(value: 7)
        XCTAssertEqual(res?.depth(), 0)
        
        res = tree.search(value: 5)
        XCTAssertEqual(res?.depth(), 1)
        
        res = tree.search(value: 1)
        XCTAssertEqual(res?.depth(), 2)
        
        res = tree.search(value: 9)
        XCTAssertEqual(res?.depth(), 2)
        
        res = tree.search(value: 10)
        XCTAssertEqual(res?.depth(), 1)
        
    }
    
    func testSearch() {
        var result1 = tree.search(value: 10)
        XCTAssertEqual(result1?.value, 10)
        
        result1 = tree.search(value: 12)
        XCTAssertNil(result1)
        
        result1 = tree.search(value: 9)
        XCTAssertEqual(result1?.value, 9)
    }
    
    func testRemove() {
        XCTAssertEqual(tree.height(), 2)
        var result1 = tree.search(value: 1)
        result1?.remove()
        XCTAssertEqual(tree.height(), 2)
        
        result1 = tree.search(value: 1)
        XCTAssertNil(result1)
    }
    

}

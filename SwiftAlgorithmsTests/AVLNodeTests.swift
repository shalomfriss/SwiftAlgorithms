//
//  AVLNodeTests.swift
//  SwiftAlgorithmsTests
//
//  Created by user on 11/4/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class AVLNodeTests: XCTestCase {


    func testExample() {
        let avl = AVLNode(value: 6)
        avl.insert(value: 3)
        avl.insert(value: 1)
        print(avl.height)
    }

    /*
 
                6
            5        7
        3
     1     4
 0
 */
    func testRotateRight() {
        let avl = AVLNode(value: 6)
        avl.treeRoot = avl
        avl.insert(value: 5)
        avl.insert(value: 3)
        avl.insert(value: 1)
        avl.insert(value: 7)
        avl.insert(value: 0)
        avl.insert(value: 4)
        
        avl.rotateRight(node: avl.left)
        
    }

}

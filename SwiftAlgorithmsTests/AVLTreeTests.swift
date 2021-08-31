//
//  AVLTreeTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 8/15/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class AVLTreeTests: XCTestCase {
    var tree:AVLNode<Int, Int>?
    
    override func setUpWithError() throws {
//        let temp = pow(2,3)
//        let tt = NSDecimalNumber(temp).intValue
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testTreeBalance() throws {
        print(AVLNode<Int, Int>.getPredictableTree().asString)
        let tree = AVLNode(nil, nil, nil, 400,  400).getRandomTree()
        do {
            try tree.inOrderCheckBalanced(tree)
        } catch _ {
            XCTFail("Tree is not balanced after autopopulate")
        }
    }
    
    
    func testRotateLeft() {
        let tree = AVLNode(nil, nil, nil, 5,  5)
        let node1 = AVLNode(nil, nil, nil, 3,  3)
        let node2 = AVLNode(nil, nil, nil, 7,  7)
        
        tree.avlInsert(aNode: node1)
        tree.avlInsert(aNode: node2)
        print(tree.asString)
        print("------------------")
        tree.rotateLeft()
        print(tree.parent!.asString)
    }

    func testRotateRight() {
        let tree = AVLNode(nil, nil, nil, 5,  5)
        let node1 = AVLNode(nil, nil, nil, 3,  3)
        let node2 = AVLNode(nil, nil, nil, 7,  7)
        tree.avlInsert(aNode: node1)
        tree.avlInsert(aNode: node2)
        print(tree.asString)
        print("------------------")
        tree.rotateRight()
        print(tree.parent!.asString)
    }
    
    /*
     10
    /
   5
  / \
 4   6
     
     */
    func testRotateLeftBig() {
        let tree = AVLNode(nil, nil, nil, 10, 10)
        var aNode:AVLNode<Int, Int>?
        
        var temp = AVLNode<Int, Int>(nil, nil, nil, 5, 1)
        tree.insert(aNode: temp)
        temp = AVLNode<Int, Int>(nil, nil, nil, 6, 1)
        tree.insert(aNode: temp)
        temp = AVLNode<Int, Int>(nil, nil, nil, 4, 1)
        tree.insert(aNode: temp)
        
        print(tree.asString)
        //print(aNode!.asString)
        tree.rotateLeft()
        print(tree.asString)
    }
    
    func testRotateRightBig() {
        let tree = AVLNode(nil, nil, nil, 10, 10)
        var aNode:AVLNode<Int, Int>?
        
        for i in 0...20 {
            let temp = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...20), 1)
            tree.insert(aNode: temp)
            if(i == 6) {
                aNode = temp
            }
        }
        
        print(tree.asString)
        print(aNode!.asString)
        tree.rotateRight()
        print(tree.asString)
    }
}

enum AVLTreeError: Error {
  case notBalanced
}

extension AVLNode {
    func inOrderCheckBalanced(_ node: AVLNode?) throws {
        if let node = node {
            let leftHeight:UInt = node.left?.height ?? 0
            let rightHeight:UInt = node.right?.height ?? 0
            let dx = abs(Int32(leftHeight) - Int32(rightHeight))
            guard dx <= 1 else {
                throw AVLTreeError.notBalanced
          }
          try inOrderCheckBalanced(node.left)
          try inOrderCheckBalanced(node.right)
        }
    }
}

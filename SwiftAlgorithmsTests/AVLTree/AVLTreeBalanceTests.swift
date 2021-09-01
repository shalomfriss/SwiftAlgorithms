//
//  AVLTreeBalanceTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 8/31/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class AVLTreeBalanceTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testTreeBalance() throws {
        print("********************")
        //print(AVLNode<Int, Int>.getPredictableTree().asString)
        //let tree = AVLNode(nil, nil, nil, 400,  400).getRandomTree()
        
        let root = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
        for _ in 1...20 {
            let temp = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
            root.avlInsert(aNode: temp)
            print("------------")
            print(root.getRoot().asString)
            do {
                try root.inOrderCheckBalanced(root)
            } catch _ {
                print("UNBALANCED")
            }
        }
        
        //let tree = AVLNode<Int, Int>.getPredictableTree()
        
        do {
            try root.inOrderCheckBalanced(root)
        } catch _ {
            XCTFail("Tree is not balanced after autopopulate")
        }
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


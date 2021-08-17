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

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testTreeBalance() throws {
        let tree = AVLNode(nil, nil, nil, 400,  400).getRandomTree()
        do {
            try tree.inOrderCheckBalanced(tree)
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

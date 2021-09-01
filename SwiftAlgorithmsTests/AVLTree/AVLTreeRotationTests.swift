//
//  AVLTreeTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 8/15/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class AVLTreeRotationTests: XCTestCase {
    var tree:AVLNode<Int, Int>?
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        super.tearDown()
    }


    
    
    //Rotate from the first tree to the second
    /*
                        15
                _______/  \______
               7                 20
            __/ \_            __/  \__
           5      10        17        24
          / \    /  \      /  \      /  \
         4   6  9    11  16    18  22    25
     
     
                 15
          ______/  \_____
         7               24
      __/ \_            /  \
     5      10        20    25
    / \    /  \      /  \
   4   6  9    11  17    22
                  /  \
                16    18
     
     */
    func testRotateLeft() {
        let tree = AVLNode<Int, Int>.getPredictableTree()
        var node = tree.search(aKey: 20)
        node?.rotateLeft()
                
        //Check root
        XCTAssertEqual(tree.left?.key, 7)
        XCTAssertEqual(tree.right?.key, 24)
        
        //Check left tree
        node = tree.search(aKey: 7)
        XCTAssertEqual(node?.left?.key, 5)
        XCTAssertEqual(node?.right?.key, 10)
        
        node = tree.search(aKey: 5)
        XCTAssertEqual(node?.left?.key, 4)
        XCTAssertEqual(node?.right?.key, 6)
        
        node = tree.search(aKey: 10)
        XCTAssertEqual(node?.left?.key, 9)
        XCTAssertEqual(node?.right?.key, 11)
        
        node = tree.search(aKey: 4)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 6)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 9)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 11)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        //Check right tree
        node = tree.search(aKey: 24)
        XCTAssertEqual(node?.left?.key, 20)
        XCTAssertEqual(node?.right?.key, 25)
        
        node = tree.search(aKey: 25)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 20)
        XCTAssertEqual(node?.left?.key, 17)
        XCTAssertEqual(node?.right?.key, 22)
        
        node = tree.search(aKey: 22)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 17)
        XCTAssertEqual(node?.left?.key, 16)
        XCTAssertEqual(node?.right?.key, 18)
        
        node = tree.search(aKey: 16)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 18)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
    }

    
    //Rotate from the first tree to the second
    /*
                        15
                _______/  \______
               7                 20
            __/ \_            __/  \__
           5      10        17        24
          / \    /  \      /  \      /  \
         4   6  9    11  16    18  22    25
     
     
                15
            ___/  \__
           7         17
        __/ \_      /  \
       5      10  16    20
      / \    /  \      /  \
     4   6  9    11  18    24
                          /  \
                        22    25
     
     */
    func testRotateRight() {
        let tree = AVLNode<Int, Int>.getPredictableTree()
        var node = tree.search(aKey: 20)
        node?.rotateRight()
        
        //Check root
        XCTAssertEqual(tree.left?.key, 7)
        XCTAssertEqual(tree.right?.key, 17)
        
        //Check right tree
        node = tree.search(aKey: 17)
        XCTAssertEqual(node?.left?.key, 16)
        XCTAssertEqual(node?.right?.key, 20)
        
        node = tree.search(aKey: 20)
        XCTAssertEqual(node?.left?.key, 18)
        XCTAssertEqual(node?.right?.key, 24)
        
        node = tree.search(aKey: 24)
        XCTAssertEqual(node?.left?.key, 22)
        XCTAssertEqual(node?.right?.key, 25)
        
        node = tree.search(aKey: 16)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 18)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 22)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 25)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        //Check left tree
        node = tree.search(aKey: 7)
        XCTAssertEqual(node?.left?.key, 5)
        XCTAssertEqual(node?.right?.key, 10)
        
        node = tree.search(aKey: 5)
        XCTAssertEqual(node?.left?.key, 4)
        XCTAssertEqual(node?.right?.key, 6)
        
        node = tree.search(aKey: 10)
        XCTAssertEqual(node?.left?.key, 9)
        XCTAssertEqual(node?.right?.key, 11)
        
        node = tree.search(aKey: 4)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 6)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 9)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
        node = tree.search(aKey: 11)
        XCTAssertNil(node?.left)
        XCTAssertNil(node?.right)
        
    }
    
    
    
    /*
                        15
                _______/  \______
               7                 20
            __/ \_            __/  \__
           5      10        17        24
          / \    /  \      /  \      /  \
         4   6  9    11  16    18  22    25
     
     
                         20
                     ___/  \___
                   15          24
               ___/  \__      /  \
              7         17  22    25
           __/ \_      /  \
          5      10  16    18
         / \    /  \
        4   6  9    11
     */
    func testRotateRootLeft() {
        let tree = AVLNode<Int, Int>.getPredictableTree()
        var node = tree.search(aKey: 15)
        node?.rotateLeft()
        
        if let root = node?.parent {
            //root
            node = root.search(aKey: 20)
            XCTAssertEqual(node?.left?.key, 15)
            XCTAssertEqual(node?.right?.key, 24)
            
            //left
            node = root.search(aKey: 15)
            XCTAssertEqual(node?.left?.key, 7)
            XCTAssertEqual(node?.right?.key, 17)
            
            node = root.search(aKey: 7)
            XCTAssertEqual(node?.left?.key, 5)
            XCTAssertEqual(node?.right?.key, 10)
            
            node = root.search(aKey: 17)
            XCTAssertEqual(node?.left?.key, 16)
            XCTAssertEqual(node?.right?.key, 18)
            
            node = root.search(aKey: 5)
            XCTAssertEqual(node?.left?.key, 4)
            XCTAssertEqual(node?.right?.key, 6)
            
            node = root.search(aKey: 10)
            XCTAssertEqual(node?.left?.key, 9)
            XCTAssertEqual(node?.right?.key, 11)
            
            node = tree.search(aKey: 4)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 6)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 9)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 11)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 16)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 18)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            //Right
            node = root.search(aKey: 24)
            XCTAssertEqual(node?.left?.key, 22)
            XCTAssertEqual(node?.right?.key, 25)
            
            node = tree.search(aKey: 22)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 25)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
        } else {
            XCTFail()
        }
    }
    
    /*
                        15
                _______/  \______
               7                 20
            __/ \_            __/  \__
           5      10        17        24
          / \    /  \      /  \      /  \
         4   6  9    11  16    18  22    25
     
                         7
                    ____/ \___
                   5          15
                  / \     ___/  \___
                 4   6  10          20
                       /  \      __/  \__
                      9    11  17        24
                              /  \      /  \
                            16    18  22    25
     */
    func testRotateRootRight() {
        let tree = AVLNode<Int, Int>.getPredictableTree()
        var node = tree.search(aKey: 15)
        node?.rotateRight()
        
        if let root = node?.parent {
            //Root
            node = root.search(aKey: 7)
            XCTAssertEqual(node?.left?.key, 5)
            XCTAssertEqual(node?.right?.key, 15)
            
            //left
            node = root.search(aKey: 5)
            XCTAssertEqual(node?.left?.key, 4)
            XCTAssertEqual(node?.right?.key, 6)
            
            //right
            node = root.search(aKey: 15)
            XCTAssertEqual(node?.left?.key, 10)
            XCTAssertEqual(node?.right?.key, 20)
            
            node = root.search(aKey: 10)
            XCTAssertEqual(node?.left?.key, 9)
            XCTAssertEqual(node?.right?.key, 11)
            
            node = root.search(aKey: 20)
            XCTAssertEqual(node?.left?.key, 17)
            XCTAssertEqual(node?.right?.key, 24)
            
            node = root.search(aKey: 17)
            XCTAssertEqual(node?.left?.key, 16)
            XCTAssertEqual(node?.right?.key, 18)
            
            node = root.search(aKey: 24)
            XCTAssertEqual(node?.left?.key, 22)
            XCTAssertEqual(node?.right?.key, 25)
            
            //leaves
            node = tree.search(aKey: 4)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 6)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 9)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 11)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 16)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 18)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 22)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
            
            node = tree.search(aKey: 25)
            XCTAssertNil(node?.left)
            XCTAssertNil(node?.right)
        }
    }
}


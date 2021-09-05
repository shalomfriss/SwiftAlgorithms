//
//  AVLTree+AVLOps.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/16/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

//MARK:- AVL tree ops
extension AVLNode {
    func avlCreateRandomTree() -> AVLNode<Int, Int> {
        let root = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
        for _ in 1...20 {
            let temp = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
            root.avlInsert(aNode: temp)
        }
        return root
    }
    
    
    /// Will create the following tree for testing
    /*
                        15
                _______/  \______
               7                 20
            __/ \_            __/  \__
           5      10        17        24
          / \    /  \      /  \      /  \
         4   6  9    11  16    18  22    25
     */
    /// - Returns: AVLNode
    public static func avlCreatePredictableTree() -> AVLNode<Int, Int> {
        let nodeKeys = [7, 20, 5, 10, 17, 24, 4, 6, 9, 11, 16, 18, 22, 25]
        let root = AVLNode<Int, Int>(nil, nil, nil, 15, 1)
        for x in nodeKeys {
            let newNode = AVLNode<Int, Int>(nil, nil, nil, x, 1)
            root.avlInsert(aNode: newNode)
        }
        return root
    }
    
    func avlInsert(aNode:AVLNode) {
        insert(aNode: aNode)
        let temp = search(aKey: aNode.key)
        temp?.avlRebalance()
    }
    
    func avlDelete(aNode:AVLNode) {
        let m = self.delete(aNode: aNode)
        m?.avlRebalance()
    }
    
    func avlRebalance() {
        let currentParent = self.parent
        if(left == nil && right != nil) {
            if(right!.height > 2) {
                print("re-left")
                print(self.getRoot().asString)
                avlRebalanceLeft()
                print(self.getRoot().asString)
            }
        } else if(left != nil && right == nil) {
            if(left!.height > 2) {
                print("re-right")
                print(self.getRoot().asString)
                avlRebalanceRight()
                print(self.getRoot().asString)
            }
        } else {
            if let left = left, let right = right {
                if(left.height > right.height + 1) {
                    print("re-right")
                    print(self.getRoot().asString)
                    avlRebalanceRight()
                    print(self.getRoot().asString)
                }
                if(right.height > left.height + 1) {
                    print("re-left")
                    print(self.getRoot().asString)
                    avlRebalanceLeft()
                    print(self.getRoot().asString)
                }
            }
        }
        
        avlAdjustHeight()
        currentParent?.avlRebalance()
    }
    
    func avlRebalanceRight() {
        let m = self.left
        if let mRight = m?.right, let mLeft = m?.left {
            if(mRight.height > mLeft.height ) {
                print("rotate left")
                m?.avlRotateLeft()
            }
        }

        
        avlRotateRight()
        self.avlAdjustHeight()
        self.left?.avlAdjustHeight()
        self.left?.left?.avlAdjustHeight()
        self.left?.right?.avlAdjustHeight()
        self.right?.avlAdjustHeight()
    }
    
    func avlRebalanceLeft() {
        let m = self.right
        if let mRight = m?.right, let mLeft = m?.left {
            if(mLeft.height  > mRight.height) {
                print("rotate right")
                m?.avlRotateRight()
            }
        }
        
        avlRotateLeft()
        self.avlAdjustHeight()
        self.left?.avlAdjustHeight()
        self.right?.avlAdjustHeight()
        self.right?.left?.avlAdjustHeight()
        self.right?.right?.avlAdjustHeight()
    }
    
    func avlAdjustHeight() {
        if(left == nil && right == nil) { height = 1 }
        else if(left != nil && right == nil) { height = left!.height + 1 }
        else if(left == nil && right != nil) { height = right!.height + 1 }
        else {
            height = 1 + Swift.max(left!.height, right!.height)
        }
    }
    
    func avlRotateLeft() {
        if let rightNode = self.right {
            
            let rightNodeLeft   = rightNode.left
            let selfParent      = self.parent
            
            var isRightNode = true
            if(self === self.parent?.left) {
                isRightNode = false
            }
            
            rightNode.left      = self
            rightNode.parent    = selfParent
            self.right          = rightNodeLeft
            self.right?.parent  = self
            self.parent         = rightNode
            
            if(isRightNode) { rightNode.parent?.right = rightNode }
            else { rightNode.parent?.left = rightNode }
            

            self.right?.avlAdjustHeight()
            self.left?.avlAdjustHeight()
            self.avlAdjustHeight()

            rightNode.right?.avlAdjustHeight()
            rightNode.left?.avlAdjustHeight()
            rightNode.avlAdjustHeight()
            rightNode.parent?.avlAdjustHeight()
        }
    }
    
    func avlRotateRight() {
        if let leftNode = self.left {
            let leftNodeRight   = leftNode.right
            let selfParent      = self.parent
        
            var isRightNode = true
            if(self === self.parent?.left) {
                isRightNode = false
            }
            
            leftNode.right      = self
            leftNode.parent    = selfParent
            self.left          = leftNodeRight
            self.left?.parent  = self
            self.parent         = leftNode
            
            
            if(isRightNode) { leftNode.parent?.right = leftNode }
            else { leftNode.parent?.left = leftNode }
            
            self.right?.avlAdjustHeight()
            self.left?.avlAdjustHeight()
            self.avlAdjustHeight()
            
            leftNode.right?.avlAdjustHeight()
            leftNode.left?.avlAdjustHeight()
            leftNode.avlAdjustHeight()
            leftNode.parent?.avlAdjustHeight()
        }
    }
}

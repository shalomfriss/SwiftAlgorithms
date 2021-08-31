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
    func getRandomTree() -> AVLNode<Int, Int> {
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
    public static func getPredictableTree() -> AVLNode<Int, Int> {
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
        temp?.rebalance()
    }
    
    func avlDelete(aNode:AVLNode) {
        let m = self.delete(aNode: aNode)
        m?.rebalance()
    }
    
    func rebalance() {
        let currentParent = self.parent
        if(left == nil && right != nil) {
            if(right!.height > 2) {
                rebalanceLeft()
            }
        } else if(left != nil && right == nil) {
            if(left!.height > 2) {
                rebalanceRight()
            }
        } else {
            if let left = left, let right = right {
                if(left.height > right.height + 1) { rebalanceRight() }
                if(right.height > left.height + 1) { rebalanceLeft() }
            }
        }
        
        adjustHeight()
        currentParent?.rebalance()
    }
    
    func rebalanceRight() {
        if let m = self.left {
            if let mRight = m.right, let mLeft = m.left {
                if(mRight.height > mLeft.height ) {
                    m.rotateLeft()
                }
            }
            
//            if(m.left == nil && m.right != nil) {
//                    m.rotateLeft()
//            } else {
//                if let mRight = m.right, let mLeft = m.left {
//                    if(mRight.height > mLeft.height ) {
//                        m.rotateLeft()
//                    } else {
//                        m.rotateRight()
//                    }
//                }
//            }
        }
        
        rotateRight()
    }
    
    func rebalanceLeft() {
        if let m = self.right {
            if let mRight = m.right, let mLeft = m.left {
                if(mLeft.height  > mRight.height) {
                    m.rotateRight()
                }
            }
            
//            if(m.left != nil && m.right == nil) {
//                if(m.left!.height > 1) {
//                    m.rotateRight()
//                }
//            } else if(m.left == nil && m.right != nil) {
//                if(m.right!.height > 1) {
//                    m.rotateLeft()
//                }
//            } else {
//                if let mRight = m.right, let mLeft = m.left {
//                    if(mRight.height  > mLeft.height) {
//                        m.rotateLeft()
//                    } else {
//                        m.rotateRight()
//                    }
//                }
//            }
        }
        
        rotateLeft()
    }
    
    func adjustHeight() {
        if(left == nil && right == nil) { height = 1 }
        else if(left != nil && right == nil) { height = left!.height }
        else if(left == nil && right != nil) { height = right!.height }
        else {
            height = 1 + Swift.max(left!.height, right!.height)
        }
    }
    
    func rotateLeft() {
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
            

            self.right?.adjustHeight()
            self.left?.adjustHeight()
            self.adjustHeight()

            rightNode.right?.adjustHeight()
            rightNode.left?.adjustHeight()
            rightNode.adjustHeight()
            rightNode.parent?.adjustHeight()
        }
    }
    
    func rotateRight() {
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
            
            self.right?.adjustHeight()
            self.left?.adjustHeight()
            self.adjustHeight()
            
            leftNode.right?.adjustHeight()
            leftNode.left?.adjustHeight()
            leftNode.adjustHeight()
            leftNode.parent?.adjustHeight()
        }
    }
    
}



/*
 
     606
 ____/ \___
42         620
 \           \
  72         764
 /  \        / \
51    586  655   822
     /    /     / \
  470  640   772   866
  /            \     \
305             802   942
/ \                   /
304   435             897
/     /
275   307
 
 */

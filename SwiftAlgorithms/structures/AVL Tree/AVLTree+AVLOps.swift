//
//  AVLTree+AVLOps.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/16/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

extension AVLNode {
    func getRandomTree() -> AVLNode<Int, Int> {
        let root = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
        for _ in 1...20 {
            let temp = AVLNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
            root.AVLInsert(aNode: temp)
        }
        return root
    }
    
    func AVLInsert(aNode:AVLNode) {
        insert(aNode: aNode)
        let temp = search(aKey: aNode.key)
        temp?.rebalance()
    }
    
    func AVLDelete(aNode:AVLNode) {
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
        guard let m = self.left else { return }
        if(m.left != nil && m.right == nil) {
            if(m.left!.height > 1) {
                m.rotateRight()
            }
        } else if(m.left == nil && m.right != nil) {
            if(m.right!.height > 1) {
                m.rotateLeft()
            }
        } else {
            if let mRight = m.right, let mLeft = m.left {
                if(mRight.height > mLeft.height ) {
                    m.rotateLeft()
                } else {
                    m.rotateRight()
                }
            }
        }
    }
    
    func rebalanceLeft() {
        guard let m = self.right else { return }
        if(m.left != nil && m.right == nil) {
            if(m.left!.height > 1) {
                m.rotateRight()
            }
        } else if(m.left == nil && m.right != nil) {
            if(m.right!.height > 1) {
                m.rotateLeft()
            }
        } else {
            if let mRight = m.right, let mLeft = m.left {
                if(mRight.height  > mLeft.height) {
                    m.rotateLeft()
                } else {
                    m.rotateRight()
                }
            }
        }
    }
    
    func adjustHeight() {
        if(left == nil && right == nil) { height = 1 }
        else if(left != nil && right == nil) { height = left!.height }
        else if(left == nil && right != nil) { height = right!.height }
        else {
            height = 1 + Swift.max(left!.height, right!.height)
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
    
    func rotateLeft() {
        if let rightNode = self.right {
            rightNode.parent = self.parent
            self.parent = rightNode
            
            let rightNodeLeftBranch = rightNode.left
            rightNode.left = self
            self.right = rightNodeLeftBranch
            self.right?.parent = self
            
            self.right?.adjustHeight()
            self.left?.adjustHeight()
            self.adjustHeight()
            
            rightNode.right?.adjustHeight()
            rightNode.adjustHeight()
            rightNode.parent?.adjustHeight()
            
        }
    }
    
    func rotateRight() {
        if let leftNode = self.left {
            leftNode.parent = self.parent
            self.parent = leftNode
            
            let leftNodeRightBranch = leftNode.right
            leftNode.right = self
            self.left = leftNodeRightBranch
            self.left?.parent = self
            
            self.left?.adjustHeight()
            self.right?.adjustHeight()
            self.adjustHeight()
            
            leftNode.left?.adjustHeight()
            leftNode.adjustHeight()
            leftNode.parent?.adjustHeight()
        }
    }
    
}

//
//  AVLTree.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/13/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

class AVLNode<T:Comparable,U> {
    var parent:AVLNode?
    var left:AVLNode?
    var right:AVLNode?
    var key:T
    var value:U?
    var height:UInt = 1
    
    init(_ parent:AVLNode?, _ left:AVLNode?, _ right:AVLNode?, _ key:T, _ value:U?) {
        self.parent = parent
        self.left = left
        self.right = right
        self.key = key
        self.value = value
    }
    
    //MARK:- Binary tree ops
    func inOrderTreeWalk(x:AVLNode?, block:(AVLNode?) -> Void) {
        if(x == nil) { return }
        inOrderTreeWalk(x: x?.left, block: block)
        block(x)
        inOrderTreeWalk(x: x?.right, block: block)
    }
    
    func search(aKey:T) -> AVLNode? {
        var currentNode:AVLNode? = self
        while(currentNode != nil && aKey != currentNode?.key) {
            if(aKey < currentNode!.key) { currentNode = currentNode?.left }
            else { currentNode = currentNode?.right }
        }
        return currentNode
    }
    
    func recursiveSearch(aKey:T) -> AVLNode? {
        if(aKey == self.key) { return self }
        if(left == nil && right == nil) { return nil }
        if(aKey < self.key) { return self.left?.recursiveSearch(aKey: aKey) }
        else { return self.right?.recursiveSearch(aKey: aKey) }
    }
    
    func min() -> AVLNode {
        var currentNode = self
        while let leftNode = currentNode.left { currentNode = leftNode }
        return currentNode
    }
    
    func max() -> AVLNode {
        var currentNode = self
        while let rightNode = currentNode.right { currentNode = rightNode }
        return currentNode
    }
    
    func successor() -> AVLNode? {
        if(self.right != nil) { return self.right?.min() }
        var x = self
        var y = self.parent
        while(y != nil && x === y?.right) {
            x = y!
            y = y?.parent
        }
        return y
    }
    
    func insert(aNode:AVLNode) {
        var currentNode:AVLNode? = self
        var y:AVLNode? = nil
        
        while(currentNode != nil) {
            y = currentNode
            if(aNode.key < currentNode!.key) { currentNode = currentNode?.left }
            else { currentNode = currentNode?.right }
        }
        
        aNode.parent = y
        if(aNode.key < y!.key) {
            y?.left = aNode
        } else {
            y?.right = aNode
        }
    }
    
    func transplant(_ u:AVLNode?, _ v:AVLNode?) {
        if(u === u?.parent?.left) { u?.parent?.left = v }
        else { u?.parent?.right = v }
        v?.parent = u?.parent
    }
    
    func delete(aNode:AVLNode) -> AVLNode? {
        if(aNode.left == nil) {
            transplant(aNode, aNode.right)
            return aNode.right?.parent
        } else if(aNode.right == nil) {
            transplant(aNode, aNode.left)
            return aNode.left?.parent
        } else {
            let y = aNode.right?.min()
            if(y?.parent !== aNode) {
                //Replace the current min with it's right subtree so that we don't lose it
                //Basically deleting it
                transplant(y, y?.right)
                y?.right = aNode.right
                y?.right?.parent = y
            }
            transplant(aNode, y)
            y?.left = aNode.left
            y?.left?.parent = y
            return y?.parent
        }
    }
}



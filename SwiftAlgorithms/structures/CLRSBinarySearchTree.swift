//
//  CLRSBinarySearchTree.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/12/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

class BSTNode<T:Comparable,U> {
    var parent:BSTNode?
    var left:BSTNode?
    var right:BSTNode?
    var key:T
    var val:U
    
    init(_ parent:BSTNode?, _ left:BSTNode?, _ right:BSTNode?, _ key:T, _ val:U) {
        self.left = left
        self.right = right
        self.key = key
        self.val = val
    }
    
    func getRandomTree() -> BSTNode<Int, Int> {
        let root = BSTNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
        for _ in 1...20 {
            let temp = BSTNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
            root.insert(aNode: temp)
        }
        return root
    }
    
    func print() {
        Swift.print("\(key):\(val)")
    }
    
    func inOrderTreeWalk(x:BSTNode?, block:(BSTNode?) -> Void) {
        if(x == nil) { return }
        inOrderTreeWalk(x: x?.left, block: block)
        block(x)
        inOrderTreeWalk(x: x?.right, block: block)
    }
    
    func search(aKey:T) -> BSTNode? {
        var currentNode:BSTNode? = self
        while(currentNode != nil && aKey != currentNode?.key) {
            if(aKey < currentNode!.key) { currentNode = currentNode?.left }
            else { currentNode = currentNode?.right }
        }
        return currentNode
    }
    
    func recursiveSearch(aKey:T) -> BSTNode? {
        if(aKey == self.key) { return self }
        if(left == nil && right == nil) { return nil }
        if(aKey < self.key) { return self.left?.recursiveSearch(aKey: aKey) }
        else { return self.right?.recursiveSearch(aKey: aKey) }
    }
    
    func min() -> BSTNode {
        var currentNode = self
        while let leftNode = currentNode.left { currentNode = leftNode }
        return currentNode
    }
    
    func max() -> BSTNode {
        var currentNode = self
        while let rightNode = currentNode.right { currentNode = rightNode }
        return currentNode
    }
    
    func successor() -> BSTNode? {
        if(self.right != nil) { return self.right?.min() }
        var x = self
        var y = self.parent
        while(y != nil && x === y?.right) {
            x = y!
            y = y?.parent
        }
        return y
    }
    
    func insert(aNode:BSTNode) {
        var currentNode:BSTNode? = self
        var y:BSTNode? = nil
        
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
    
    func transplant(_ u:BSTNode?, _ v:BSTNode?) {
        if(u === u?.parent?.left) { u?.parent?.left = v }
        else { u?.parent?.right = v }
        v?.parent = u?.parent
    }
    
    func delete(aNode:BSTNode) {
        if(aNode.left == nil) {
            transplant(aNode, aNode.right)
        } else if(aNode.right == nil) {
            transplant(aNode, aNode.left)
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
        }
    }
    
}

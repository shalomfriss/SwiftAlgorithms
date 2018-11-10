//
//  Tree.swift
//  SwiftAlgorithms
//
//  Created by user on 11/2/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation


class BinarySearchTree<T:Comparable> {
    
    var parent:BinarySearchTree?
    var leftChild:BinarySearchTree?
    var rightChild:BinarySearchTree?
    var value:T
    
    init(value: T) {
        self.value = value
    }
    
    public func insert(value:T) {
        if(value < self.value) {
            if let left = self.leftChild {
                left.insert(value: value)
            } else {
                self.leftChild = BinarySearchTree(value: value)
                self.leftChild?.parent = self
            }
        } else {
            if let right = self.rightChild {
                right.insert(value: value)
            } else {
                self.rightChild = BinarySearchTree(value: value)
                self.rightChild?.parent = self
            }
        }
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        leftChild?.traverseInOrder(process: process)
        process(value)
        rightChild?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        leftChild?.traversePreOrder(process: process)
        rightChild?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        leftChild?.traversePostOrder(process: process)
        rightChild?.traversePostOrder(process: process)
        process(value)
    }
    
    public func process(_ value: T) {
        
    }
    
    public func traverseInOrder2(process: BinarySearchTree) {
        if let left = leftChild { traverseInOrder2(process: left) }
        self.process2(node: self)
        if let right = rightChild { traverseInOrder2(process: right) }
    }
    
    public func traversePreOrder2(process:BinarySearchTree) {
        self.process2(node: self)
        if let left = leftChild { traversePreOrder2(process: left) }
        if let right = rightChild { traversePreOrder2(process: right) }
    }
    
    public func traversePostOrder2(process: BinarySearchTree) {
        if let left = leftChild {  traversePostOrder2(process: left) }
        if let right = rightChild { traversePostOrder2(process: right) }
        self.process2(node: self)
    }
    
    public func process2(node: BinarySearchTree) -> Void {
        
    }
    
    public func maxNode(node: BinarySearchTree) -> BinarySearchTree {
        if let right = rightChild {
            return maxNode(node: right)
        }
        
        return self
    }
    
    public func minNode(node: BinarySearchTree) -> BinarySearchTree {
        if let left = leftChild {
            return minNode(node: left)
        }
        
        return self
    }
    
    public func maximum() -> T {
        if let right = rightChild {
            return right.maximum()
        }
        return self.value
    }
    
    
    public func minimum() -> T {
        if let left = leftChild {
            return left.minimum()
        }
        return self.value
    }
    
    public func remove() {
        
        var newNode:BinarySearchTree? = nil
        
        if let left = self.leftChild {
            newNode = minNode(node: self)
        } else {
            if let right = self.rightChild {
                newNode = maxNode(node: self)
            }
        }
        
        if(parent?.leftChild === self) {
            parent?.leftChild = newNode
        } else {
            parent?.rightChild = newNode
        }
        
        newNode?.parent = parent
        
    }
    
    public func height() -> Int {
        if leftChild == nil && rightChild == nil {
            return 0
        } else {
            return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
        }
    }
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = leftChild { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = rightChild { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }
    
    public func search(value: T) -> BinarySearchTree? {
        if(self.value == value) {
            return self
        }
        
        if(value < self.value) {
            if let left = leftChild {
                return left.search(value: value)
            }
            return nil
        }
        
        if let right = rightChild {
            return right.search(value: value)
        }
        
        return nil
    }
    
    public func depth() -> Int {
        var node = self.parent
        var nodeDepth = 0
        while(node != nil) {
            nodeDepth = nodeDepth + 1
            node = node!.parent
        }
        
        return nodeDepth
    }
}



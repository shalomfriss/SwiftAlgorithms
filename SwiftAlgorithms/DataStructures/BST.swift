//
//  BST.swift
//  SwiftAlgorithms
//
//  Created by user on 11/3/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation


class BST<T:Comparable> {
    private var value:T
    private var left:BST?
    private var right:BST?
    private var parent:BST?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isLeaf:Bool {
        get {
            return left == nil && right == nil
        }
    }
    
    public var isRoot:Bool {
        get {
            return parent == nil
        }
    }
    
    public var isLeft:Bool {
        get {
            return parent?.left === self
        }
    }
    
    public var isRight:Bool {
        get {
            return parent?.right === self
        }
    }
    
    
    
    public func insert(value:T) {
        if(value < self.value) {
            if let leftChild = left {
                leftChild.insert(value: value)
            } else {
                left = BST(value: value)
            }
        } else {
            if let rightChild = right {
                rightChild.insert(value: value)
            } else {
                right = BST(value: value)
            }
        }
    }
    
    public func search(value:T) -> BST? {
        if(self.value == value) {
            return self
        }
        
        if(value < self.value) {
            if let leftChild = left {
                return leftChild.search(value: value)
            }
            return nil
        }
        
        if let rightChild = right {
            return rightChild.search(value: value)
        }
        
        return nil
    }
    
    
    public func delete() {
        
        if(left != nil) {
            let node = left?.maximum()
            if(isLeft == true) {
                self.parent?.left = node
            } else {
                self.parent?.right = node
            }
            node?.parent = self.parent
            
        } else if(right != nil) {
            let node = right?.minimum()
            if(isLeft == true) {
                self.parent?.left = node
            } else {
                self.parent?.right = node
            }
            node?.parent = self.parent
        }
        
        
        self.parent = nil
        self.left = nil
        self.right = nil
    }
    
    
    public func minimum() -> BST {
        if(self.left == nil) { return self }
        
        var node = self.left!
        while(node.left != nil) {
            node = node.left!
        }
        
        return node
    }
    
    public func maximum() -> BST {
        if(self.right == nil) { return self }
        
        var node = self.right!
        while(node.right != nil) {
            node = node.right!
        }
        
        return node
    }
    
    
    
}

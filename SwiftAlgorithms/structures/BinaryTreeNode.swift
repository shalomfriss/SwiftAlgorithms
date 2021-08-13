//
//  BinaryTreeNode.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/20/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class BinaryTreeNode<T:Comparable> {
    var parent:BinaryTreeNode?
    var left:BinaryTreeNode?
    var right:BinaryTreeNode?
    var key:T
    
    init(aKey:T) {
        key = aKey
    }
    
    public func isLeaf() -> Bool {
        return left == nil && right == nil
    }
    
    public func isRoot() -> Bool {
        return parent == nil
    }
    
    public func insert(newKey:T) {
        if(newKey <= key) {
            if(left != nil) {
                left?.insert(newKey: newKey)
            } else {
                left = BinaryTreeNode(aKey: newKey)
            }
        } else {
            if(right != nil) {
                right?.insert(newKey: newKey)
            } else {
                right = BinaryTreeNode(aKey: newKey)
            }
        }
    }
    
    public func search(aValue:T) -> BinaryTreeNode? {
        if(self.key == aValue) {
            return self
        }
        
        if(aValue < self.key) {
            if(left == nil) { return nil }
            return left?.search(aValue: aValue)
        } else {
            if(right == nil) { return nil }
            return right?.search(aValue: aValue)
        }
    }
    
    func getMax() -> T {
        var temp = self
        while let newTemp = temp.right {
            temp = newTemp
        }
        return temp.key
    }
    
    
    func delete(aValue:T) {
        var temp = self
        while temp.key != aValue {
            if(aValue < temp.key) {
                if(temp.left == nil) { return }
                temp = temp.left!
            } else
            {
                if(temp.right == nil) { return }
                temp = temp.right!
            }
        }
        
        if(temp.left == nil) {
            
        }
        
        if(temp.left == nil && temp.right == nil) {
            if(temp.parent?.left?.key == temp.key) {
                temp.parent?.left = nil
            }
            if(temp.parent?.right?.key == temp.key) {
                temp.parent?.right = nil
            }
        }
        
        
        
    }
}

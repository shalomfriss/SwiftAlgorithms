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
    var value:T
    
    init(aValue:T) {
        value = aValue
    }
    
    public func isLeaf() -> Bool {
        return left == nil && right == nil
    }
    
    public func isRoot() -> Bool {
        return parent == nil
    }
    
    public func insert(newValue:T) {
        if(newValue <= value) {
            if(left != nil) {
                left?.insert(newValue: newValue)
            } else {
                left = BinaryTreeNode(aValue: newValue)
            }
        } else {
            if(right != nil) {
                right?.insert(newValue: newValue)
            } else {
                right = BinaryTreeNode(aValue: newValue)
            }
        }
    }
    
    public func search(aValue:T) -> BinaryTreeNode? {
        if(self.value == aValue) {
            return self
        }
        
        if(aValue < self.value) {
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
        return temp.value
    }
    
    
    func delete(aValue:T) {
        var temp = self
        while temp.value != aValue {
            if(aValue < temp.value) {
                if(temp.left == nil) { return }
                temp = temp.left!
            } else
            {
                if(temp.right == nil) { return }
                temp = temp.right!
            }
        }
        
        if(temp.left == nil && temp.right == nil) {
            if(temp.parent?.left?.value == temp.value) {
                temp.parent?.left = nil
            }
            if(temp.parent?.right?.value == temp.value) {
                temp.parent?.right = nil
            }
        }
        
        /*
        if(temp.left != nil) {
            let leftMax = temp.left?.getMax()
            let newNode = search(aValue: leftMax)
        }
        */
        
    }
}

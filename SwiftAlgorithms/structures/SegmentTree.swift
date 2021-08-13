//
//  SegmentTree.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/13/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

class SegmentTree<T> {
    var leftBound:Int
    var rightBound:Int
    var value:T
    var function:(T, T) -> T
    var leftChild:SegmentTree<T>?
    var rightChild:SegmentTree<T>?
    
    init(_ array:[T], _ leftBound:Int, _ rightBound:Int, _ function:@escaping (T, T) -> T) {
        self.leftBound = leftBound
        self.rightBound = rightBound
        self.function = function
        
        if(leftBound == rightBound) {
            value = array[leftBound]
        } else {
            let mid = (leftBound + rightBound)/2
            leftChild = SegmentTree<T>(array, leftBound, mid, function)
            rightChild = SegmentTree<T>(array, mid + 1, rightBound, function)
            
            value = function(leftChild!.value, rightChild!.value)
        }
    }
    
    func query(_ leftBound:Int, _ rightBound:Int) -> T {
        if(leftBound == self.leftBound && rightBound == self.rightBound) {
            return self.value
        }
        
        guard let leftChild = leftChild else { fatalError("Left child doesn't exist") }
        guard let rightChild = rightChild else { fatalError("right child doesn't exist") }
        
        if( leftBound > leftChild.rightBound) {
            return rightChild.query(leftBound, rightBound)
        } else if(rightBound < rightChild.leftBound) {
            return leftChild.query(leftBound, rightBound)
        } else {
            let leftResult = leftChild.query(leftBound, leftChild.rightBound)
            let rightResult = rightChild.query(rightChild.leftBound, rightBound)
            return function(leftResult, rightResult)
        }
    }
    
    public func replaceItem(_ atIndex:Int, _ withItem:T) {
        if self.leftBound == self.rightBound {
            self.value = withItem
        } else if let leftChild = self.leftChild, let rightChild = self.rightChild {
            if(leftChild.rightBound >= atIndex) {
                leftChild.replaceItem(atIndex, withItem)
            } else {
                rightChild.replaceItem(atIndex, withItem)
            }
            self.value = function(leftChild.value, rightChild.value)
        }
    }
}

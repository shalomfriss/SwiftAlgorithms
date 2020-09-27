//
//  Heap.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/1/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class Heap<T> {
    
    //The item array
    public var nodes:[T] = [T]()
    
    //The sort function
    public var isBefore: (T, T) -> Bool
    
    
    //MARK:- Init
    //Init with a sort function
    public init(sort: @escaping (T, T) -> Bool) {
      self.isBefore = sort
    }
    
    //Init with items and a sort function
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
      self.isBefore = sort
        
        nodes = array
        for i in stride(from: (nodes.count/2 - 1), through: 0, by: -1) {
            self.shiftDown(i: i)
        }
    }
    
    
    //MARK:- Utils
    //Get the parent index
    public func parent(_ i:Int) -> Int{
        return (i - 1) / 2
    }
    
    //Get the left child index
    public func left(_ i:Int) -> Int {
        return 2*i + 1
    }
    
    //Get the right child index
    public func right(_ i:Int) -> Int {
        return 2*i + 2
    }
    
    //Swap two elements
    private func swap(i:Int, j:Int) {
        let temp = nodes[i]
        nodes[i] = nodes[j]
        nodes[j] = temp
    }
    
    //Heap shift down function
    private func shiftDown(i:Int) {
        let item = nodes[i]
        let leftIndex = left(i)
        let rightIndex = right(i)
        
        let leftNode:T? = leftIndex < nodes.count ? nodes[leftIndex] : nil
        let rightNode:T? = rightIndex < nodes.count ? nodes[rightIndex] : nil
        
        if(leftNode == nil && rightNode == nil) {
            return
        }
        
        if(leftNode == nil) {
            if(isBefore(rightNode!, item)) {
                self.swap(i: i, j: right(i))
                self.shiftDown(i: right(i))
            }
            return
        }
        
        if(rightNode == nil) {
            if(isBefore(leftNode!, item)) {
                self.swap(i: i, j: left(i))
                self.shiftDown(i: left(i))
            }
            return
        }
        
        if(isBefore(leftNode!, rightNode!)) {
            if(isBefore(leftNode!, item)) {
                self.swap(i: i, j: left(i))
                self.shiftDown(i: left(i))
            }
        } else {
            if(isBefore(rightNode!, item)) {
                self.swap(i: i, j: right(i))
                self.shiftDown(i: right(i))
            }
        }
    }
    
    //Heap shift up function
    private func shiftUp(i:Int) {
        if(i == 0) { return }
        let theParent = nodes[parent(i)]
        let item = nodes[i]
        if(isBefore(item, theParent)) {
            swap(i: i, j: parent(i))
            self.shiftUp(i: parent(i))
        }
    }
    
    
    //MARK:- API
    //Insert an item
    public func insert(_ item:T) {
        nodes.append(item)
        shiftUp(i: nodes.count - 1)
    }
    
    //Insert items
    public func insert(_ items:[T]) {
        for x in items {
            insert(x)
        }
    }
    
    //Remove an item
    @discardableResult public func remove() -> T? {
        if(nodes.count == 0) {
            return nil
        }
        
        if(nodes.count == 1) {
            return nodes.removeLast()
        }
        
        let item = nodes[0]
        let last = nodes.removeLast()
        nodes[0] = last
        self.shiftDown(i: 0)
        
        return item
    }
    
    //Remove item at index
    public func remove(at:Int) -> T? {
        if(nodes.count == 0 || at < 0 || at > nodes.count - 1) { return nil }
        if(nodes.count == 1) { return nodes.removeLast() }
        
        let result = nodes[at]
        nodes[at] = nodes[nodes.count - 1]
        shiftDown(i: at)
        shiftUp(i: at)
        
        nodes.removeLast()
        return result
    }
    
    //Replace value at index
    public func replace(index:Int, value:T) {
        if(index < 0 || index > nodes.count - 1) { return }
        nodes[index] = value
        shiftDown(i: index)
        shiftUp(i: index)
    }
    
    //Check if empty
    public var isEmpty: Bool {
      return nodes.isEmpty
    }
    
    //Get an element count
    public var count: Int {
      return nodes.count
    }
    
    //Peek at the top value
    public func peek() -> T? {
        return nodes.first
    }
    
    public func sort() {
        
    }
}

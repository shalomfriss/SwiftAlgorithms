//
//  Heap.swift
//  SwiftAlgorithms
//
//  Created by user on 11/11/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

//Max heap meaning the max item is at index 0
class Heap<T:Comparable> {
    var items = [T]()
    
    init() {}
    
    public func insert(value:T) {
        items.append(value)
        
        let index = items.count - 1
        shiftUp(index: index)
    }
    
    public func remove() -> T? {
        return nil
    }
    
    public func removeRoot() ->T? {
        if(items.count == 0) {
            return nil
        }
        
        self.swap(i: 0, j: items.count - 1)
        let root = items.removeLast()
        
        self.shiftDown(index: 0, until: items.count)
        return root
    }
    
    public func swap(i:Int, j:Int) {
        let temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
    
    public func removeAtIndex(index:Int) -> T? {
        swap(i: index, j: items.count - 1)
        
        let val = items[index]
        let returnVal = items.removeLast()
        if let parentValue = getParent(index: index) {
            if(val > parentValue) {
                shiftUp(index: index)
            } else {
                shiftDown(index: index, until: items.count)
            }
        }
        
        return returnVal
    }
    
    public func replace(index:Int, value:T) {
        items[index] = value
        if let parentValue = getParent(index: index) {
            if(value > parentValue) {
                shiftUp(index: index)
            } else {
                shiftDown(index: index, until: items.count)
            }
        }
    }
    
    //returns the index of the value
    public func search(value:T) -> Int? {
        let queue = Queue<Int>()
        print("Search for: \(value)")
        
        queue.push(item: 0)
        queue.push(item: -1)
        
        var keepSearching = false
        while(queue.notEmpty())  {
            let item = queue.pop()
            
            //Weve reached a level
            if(item == -1) {
                if(keepSearching == false) {
                    return nil
                }
                keepSearching = false
                queue.push(item: -1)
                continue
            }
            
            let heapVal = items[item!]
            if(value == heapVal) {
                return item
            }
            
            //as long the the value is smaller then the larges elements keep seraching
            if(value < heapVal) {
                keepSearching = true
            }
            
            if let _ = getLeft(index: item!) {
                queue.push(item: getLeftIndex(index: item!))
            }
            
            if let _ = getRight(index: item!) {
                queue.push(item: getRightIndex(index: item!))
            }
        }
        
        return nil
    }
    
    //Swap this index with it's parent
    public func swapUp(index:Int) {
        if let parent = getParent(index: index) {
            items[getParentIndex(index: index)] = items[index]
            items[index] = parent
        }
    }
    
    //The heap shift up operation
    public func shiftUp(index:Int) {
        var index = index
        var parentValue = getParent(index: index)
        let value = items[index]
        
        while(parentValue != nil) {
            if(value > parentValue!) {
                swapUp(index: index)
            } else {
                return
            }
            index = getParentIndex(index: index)
            parentValue = getParent(index: index)
        }
    }
    
    //Shift down from index until the specified index
    public func shiftDown(index:Int, until:Int) {
        if(index == until) { return }
        
        let theLeftIndex = getLeftIndex(index: index)
        let theRightIndex = getRightIndex(index: index)
        let theLeft = theLeftIndex < until ? getLeft(index: index) : nil
        let theRight = theRightIndex < until ? getRight(index: index) : nil
        let value = items[index]
        
        if(theLeft != nil && theRight != nil) {
            let swapIndex = theLeft! > theRight! ? theLeftIndex : theRightIndex
            let swapValue = theLeft! > theRight! ? theLeft! : theRight!
            if(swapValue > value) {
                swapUp(index: swapIndex)
                shiftDown(index: swapIndex, until: until)
            }
        } else if(theLeft != nil && theLeft! > value){
            swapUp(index: theLeftIndex)
        } else if(theRight != nil && theRight! > value) {
            swapUp(index: theRightIndex)
        }
        
    }
    
    public func buildHeapUsingFloyd(array:[T]) {
        let elements = array
        for i in stride(from: elements.count/2 - 1, through: 0, by: -1) {
            shiftDown(index: i, until: elements.count)
        }
    }
    
    public func buildHeap(array:[T]) {
        for item in array {
            insert(value: item)
        }
    }
    
    
    public func peek() -> T? {
        return items[0]
    }
    
    
    
    /************************************/
    //INDEX UTILITY
    /************************************/
    public func getParentIndex(index:Int) -> Int {
        return Int(floor((Double(index) - 1)/2))
    }
    
    public func getLeftIndex(index:Int) -> Int {
        return 2*index + 1
    }
    
    public func getRightIndex(index:Int) -> Int {
        return 2*index + 2
    }
    
    public func getParent(index:Int) -> T? {
        let pIndex = getParentIndex(index: index)
        if(pIndex < 0 || pIndex > items.count - 1) {
            return nil
        }
        
        return items[pIndex]
    }
    
    public func getLeft(index:Int) -> T? {
        let lIndex = getLeftIndex(index: index)
        if(lIndex < 0 || lIndex > items.count - 1) {
            return nil
        }
        
        return items[lIndex]
    }
    
    public func getRight(index:Int) -> T? {
        let rIndex = getRightIndex(index: index)
        if(rIndex < 0 || rIndex > items.count - 1) {
            return nil
        }
        return items[rIndex]
    }
    
    public func printme() {
        print(self.items)
    }
}

//
//  heap.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 10/21/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

/**
     Heap implementation.  Default is a min heap.
*/
class OldHeap {
    
    static var MIN:String = "min"
    static var MAX:String = "max"
    
    private var items:[Double]
    private var mode:String = OldHeap.MIN
    
    init()
    {
        Swift.print("Heap")
        self.items = [Double]()
    }
    
    public func getTopItem() -> Double
    {
        let item = self.items.popLast()
        let ret = self.items[0]
        self.items[0] = item!
        self.heapify()
        return ret
    }
    
    public func print()
    {
        Swift.print(self.items)
    }
    
    /**
         A comparison function to abstract from comparison in order to support min and
         max heaps
         @param val1:Double - a value to compare
         @param val2:Double - a secomd value to compare
     */
    private func compare(val1:Double, val2:Double) -> Int
    {
        if(self.mode == OldHeap.MIN)
        {
            if(val1 < val2)
            {
                return 1
            }
            else if(val1 == val2)
            {
                return 0
            }
            else
            {
                return -1
            }
        }
        else
        {
            if(val1 > val2)
            {
                return 1
            }
            else if(val1 == val2)
            {
                return 0
            }
            else
            {
                return -1
            }
        }
    }
    
    public func addItem(val:Double)
    {
        self.items.append(val)
        
        //If not parent we're at the top
        guard let parent = getParent(index: self.items.count - 1)
        else {
            return
        }
        
        var curIndex = self.items.count - 1
        var parIndex = Int(floor((Double(curIndex) - 1)/2))
        
        var vala = val
        var valb = parent
        
        while(self.compare(val1: vala, val2: valb) == 1)
        {
            self.swap(index1: curIndex, index2: parIndex)
            curIndex = parIndex
            parIndex = Int(floor((Double(curIndex) - 1)/2))
            if(parIndex < 0)
            {
                return
            }
            Swift.print(parIndex)
            vala = self.items[curIndex]
            valb = self.items[parIndex]
        }
        
        //self.heapify(index: self.items.count - 1)
    }
    
    private func swap(index1:Int, index2:Int)
    {
        let temp = self.items[index1]
        self.items[index1] = self.items[index2]
        self.items[index2] = temp
    }
    
    public func heapify()
    {
        var cur = 0
        let el = self.items[cur]
        var childs = self.getChildren(index: cur)
        var greaterChild:Double!
        var greaterIndex:Int!
        
        while(childs.0 != nil || childs.1 != nil)   //At least one isn't nil
        {
            
            if(childs.0 != nil && childs.1 != nil)  //Neither are nil
            {
                greaterChild = self.compare(val1: childs.0!, val2: childs.1!) == 1 ? childs.0! : childs.1!
                greaterIndex = self.compare(val1: childs.0!, val2: childs.1!) == 1 ? cur * 2 + 1 : cur * 2 + 2
            }
            else    //One of them is nil
            {
                greaterChild = childs.0 != nil ? childs.0! : childs.1!
                greaterIndex = childs.0 != nil ? cur * 2 + 1 : cur * 2 + 2
            }
            
            if(self.compare(val1: greaterChild, val2: el) == 1)
            {
                self.swap(index1: cur, index2: greaterIndex)
                cur = greaterIndex
                childs = self.getChildren(index: cur)
            }
            else
            {
                return
            }
            
        }
        
        
    }
    
    
    
    
    
    /**
         Get the parent of the object at index
     */
    public func getParent(index:Int) -> Double?
    {
        
        if(index == 0)
        {
            return nil
        }
        
        let ind = Int(floor((Double(index) - 1)/2))
        let ret:Double = self.items[ind]
        return ret
        
        //return Double(self.items[floor((index - 1)/2)])
        
    }
    
    public func getChildren(index:Int) -> (Double?, Double?)
    {
        let i1 = 2*index + 1
        let i2 = 2*index + 2
        
        if(i1 > self.items.count - 1)
        {
            return (nil, nil)
        }
        
        if(i2 > self.items.count - 1)
        {
            return (self.items[i1], nil)
        }
        
        return (self.items[i1], self.items[i2])
        
        
    }
}

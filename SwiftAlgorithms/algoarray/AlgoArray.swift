//
//  AlgoArray.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 10/21/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

class AlgoArray
{
    private var items:[ArrayItem]
    private var uuidToIndex:[String:Int]
    
    init()
    {
        self.items = [ArrayItem]()
        self.uuidToIndex = [String:Int]()
    }
    
    public func addItem(value:Float, key:String? = nil)
    {
        var item:ArrayItem
        if(key != nil) {
            item = ArrayItem(aValue: value, aKey: key!)
        }
        else {
            item = ArrayItem(aValue: value)
        }
        
        self.uuidToIndex[item.id] = self.items.count
        self.items.append(item)
    }
    
    public func removeItem(item:ArrayItem) {
        let ind:Int? = self.uuidToIndex[item.id]
        if(ind == nil)
        {
            return
        }
        self.items.remove(at: ind!)
        self.uuidToIndex.removeValue(forKey: item.id)
    }
    
    public func printme() {
        for i in 0..<self.items.count {
            let item = items[i]
            print(item.value)
        }
        
    }
}

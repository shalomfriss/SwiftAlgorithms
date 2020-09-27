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
    private var items:NSMutableArray
    private var uuidToIndex:[String:Int]
    
    init()
    {
        self.items = NSMutableArray()
        self.uuidToIndex = [String:Int]()
    }
    
    public func addItem(value:Float, key:String?)
    {
        let item = ArrayItem(aKey: key!, aValue: value)
        self.uuidToIndex[item.id] = self.items.count
        self.items.add(item)
    }
    
    public func removeItem(item:ArrayItem) {
        let ind:Int? = self.uuidToIndex[item.id]
        if(ind == nil)
        {
            return
        }
        
        self.items.removeObject(at: ind!)
        self.uuidToIndex.removeValue(forKey: item.id)
    }
}

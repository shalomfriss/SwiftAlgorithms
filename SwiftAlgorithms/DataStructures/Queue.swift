//
//  Queue.swift
//  SwiftAlgorithms
//
//  Created by user on 11/2/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class Queue<T> {
    private var items = [T]()
    private var queueIndex = 0
    private var itemCount = 0
    
    public func push(item:T) {
        items.append(item)
        itemCount = itemCount + 1
    }
    
    public func pop() -> T? {
        if(itemCount > 0) {
            itemCount = itemCount - 1
            queueIndex = queueIndex + 1
            return items[queueIndex - 1]
        }
        return nil
    }
    
    public func notEmpty() -> Bool {
        return itemCount > 0
    }
    
}



//
//  ArrayItem.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 10/21/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import Foundation

class ArrayItem : Comparable
{
    public var value:Float
    public var key:String
    public var id:String
    init()
    {
        self.value = 0
        self.key = ""
        self.id = UUID().uuidString
    }
    
    init(aKey:String, aValue:Float)
    {
        self.value = aValue
        self.key = aKey
        self.id = UUID().uuidString
    }
}

func < (lhs: ArrayItem, rhs: ArrayItem) -> Bool {
    return lhs.value < rhs.value
}

func == (lhs: ArrayItem, rhs: ArrayItem) -> Bool {
    return lhs.value == rhs.value
}

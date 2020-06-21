//
//  MaxHeap.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/20/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class HeapNode {
    var parent:HeapNode?
    var left:HeapNode?
    var right:HeapNode?
    var value:Int
    
    init(aValue:Int) {
        value = aValue
    }
}

class MaxHeap {
    var root:HeapNode?
    
    
}

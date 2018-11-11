//
//  HeapSort.swift
//  SwiftAlgorithms
//
//  Created by user on 11/11/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class HeapSort<T:Comparable> {
    public let heap = Heap<T>()
    
    init(array:[T]) {
        heap.buildHeap(array: array)
        
        
        var backIndex = array.count - 1
        while(backIndex > 0) {
            heap.swap(i: 0, j: backIndex)
            heap.shiftDown(index: 0, until: backIndex)  //Shift down is non inclusive
            heap.printme()
            backIndex = backIndex - 1
        }
        
        
    }
}


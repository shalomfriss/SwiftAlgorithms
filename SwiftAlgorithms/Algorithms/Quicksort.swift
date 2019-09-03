//
//  Quicksort.swift
//  SwiftAlgorithms
//
//  Created by user on 11/16/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class Quicksort<T:Comparable> {
    
    class func sort(_ array:[T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let mid = array[array.count/2]
        let lower = array.filter { $0 < mid }
        let equal = array.filter { $0 == mid }
        let upper = array.filter { $0 > mid }
        
        return Quicksort.sort(lower) + equal + Quicksort.sort(upper)
    }
    
    /*
    //Method 2 using a manual pointer
    class func sort2(_ array:[T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let pivotIndex = array.count/2
        let pivot = array[pivotIndex]
        var index1 = 0
        var index2 = array.count - 1
        
        var lesser = [T]()
        var equal = [T]()
        var greater = [T]()
        equal.append(pivot)
        
        while(index1 < pivotIndex && index2 > pivotIndex) {
            if(array[index1] < pivot) {
                index1 += 1
            }
            
            if(array[index2] > pivot) {
                index2 -= 1
            }
        }
        
        return array
    }
    */
    
}

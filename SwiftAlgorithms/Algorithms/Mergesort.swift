//
//  Mergesort.swift
//  SwiftAlgorithms
//
//  Created by user on 11/16/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class Mergesort<T:Comparable> {
    class func sort(_ array:[T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let mid = array.count/2
        let left = Mergesort.sort(Array(array[0..<mid]))
        let right = Mergesort.sort(Array(array[mid..<array.count]))
        
        return Mergesort.merge(left: left, right: right)
    }
    
    class func merge(left:[T], right:[T]) -> [T] {
        var i = 0
        var j = 0
        var result = [T]()
        while(i < left.count && j < right.count) {
            if(left[i] < right[j]) {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }
        
        while(i < left.count) {
            result.append(left[i])
            i += 1
        }
        
        while(j < right.count) {
            result.append(right[j])
            j += 1
        }
        
        return result
    }
    
}

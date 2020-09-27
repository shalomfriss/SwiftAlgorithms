//
//  MaximumSubarray.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/18/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class MaximumSubarray {
    
    public func find(_ items:[Int]) -> Int {
        var theMax = 0
        return findMaxDP(items, 0, items.count - 1, 0)
    }
    
    private func findMax(_ items:[Int], _ leftIndex:Int, _ rightIndex:Int, _ sum:Int) -> Int {
        if(leftIndex >= rightIndex) { return sum }
        
        var leftIndex = leftIndex
        var rightIndex = rightIndex
        var leftSum = 0
        var rightSum = 0
        var theMax = 0
        
        var sum = sum
        while(leftIndex < rightIndex) {
            rightSum = sum - items[leftIndex]
            leftSum = sum - items[rightIndex]
            
            if(leftSum < rightSum) {
                sum = rightSum
                theMax = max(theMax, sum)
                leftIndex += 1
            } else if(rightSum < leftSum) {
                sum = leftSum
                theMax = max(theMax, sum)
                rightIndex -= 1
            } else {
                let max1 = findMax(items, leftIndex + 1, rightIndex, leftSum)
                let max2 = findMax(items, leftIndex, rightIndex - 1, rightSum)
                if(max1 > max2) {
                    leftIndex += 1
                } else {
                    rightIndex -= 1
                }
                theMax = max(max1, max2, theMax)
            }
                
        }
        
        return theMax
    }
    
    
    //n + 2(n-1) + (2^2)(n-2) + ... + (2^m)(n-m) + ... + 2^(n-1) < 2^n (sum of n) = O(n^2)
    var dpmemo = [[Int]]()
    private func findMaxDP(_ items:[Int], _ leftIndex:Int, _ rightIndex:Int, _ sum:Int) -> Int {
        //if(dpmemo[leftIndex][rightIndex] ) {
            
        //}
        
        if(leftIndex >= rightIndex) { return 0 }
        
        var sum = 0
        for x in leftIndex...rightIndex {
            sum += items[x]
        }
        
        let sum1 = findMaxDP(items, leftIndex + 1, rightIndex, sum)
        let sum2 = findMaxDP(items, leftIndex, rightIndex - 1, sum)
        return max(sum, sum1, sum2)
    }
}

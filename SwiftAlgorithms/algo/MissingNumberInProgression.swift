//
//  MissingNumberInProgression.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/11/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/missing-number-in-arithmetic-progression/
class MissingNumberInProgression {
    func missingNumber(_ arr: [Int]) -> Int {
        
        if(arr.count == 1 || arr.count == 2) {
            return 0
        }
        
        var arr = arr
        var smallDiff = arr[1] - arr[0]
        var bigDiff = smallDiff + 1
        if(smallDiff < 0) {
            arr = arr.reversed()
            smallDiff = arr[1] - arr[0]
        }
        
        for i in 1..<(arr.count - 1) {
            let diff = arr[i + 1] - arr[i]
            if(diff != smallDiff) {
                bigDiff = diff
            }
        }
        
        if(bigDiff < smallDiff) {
            let temp = bigDiff
            bigDiff = smallDiff
            smallDiff = temp
        }
        
        var lowerIndex = 0
        for i in 0..<(arr.count - 1) {
            let diff = arr[i + 1] - arr[i]
            if(diff == bigDiff) {
                lowerIndex = i
            }
        }
        
        
        return arr[lowerIndex] + smallDiff
        
    }
}

//
//  ArrayProductExcludingCurrent.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/16/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

/**
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

 Note: Please solve it without division and in O(n).

 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 */

class ArrayProductExcludingCurrent {
    
    var hash = [Int:Int]()
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var nums = nums
        if(nums.count == 1) { return nums }
        if(nums.count == 2) {
            nums.swapAt(0, 1)
            return nums
        }
        
        var zeros = 0
        var product = 1
        for x in nums {
            if(x == 0) {
                zeros += 1
                continue
            }
            product *= x
        }
        
        if(zeros > 1) { return Array(repeating: 0, count: nums.count) }
        
        if(zeros > 0) {
            for i in 0..<nums.count {
                if(nums[i] == 0) {
                    nums[i] = product
                } else{
                    nums[i] = 0
                }
            }
            return nums
        }
        
        var mult = product < 0 ? -1 : 1
        var absProduct = abs(product)
        for i in 0..<nums.count {
            if(abs(nums[i]) == 1) {
                nums[i] = absProduct * mult * nums[i]
                continue
            }
            
            if(abs(nums[i]) == 2) {
                nums[i] = (absProduct >> 1) * mult * (nums[i] < 0 ? -1 : 1)
                continue
            }
            
            if let res = hash[nums[i]] {
                nums[i] = res
                continue
            }
           
            let temp = calc(nums[i], product)
            hash[nums[i]] = temp
            nums[i] = temp
        }
        
        return nums
    }

    func calc(_ a:Int, _ prod:Int) -> Int {
        
        var mult = prod < 0 ? -1 : 1
        var amult = a < 0 ? -1 : 1
        
        var prod = abs(prod)
        var a = abs(a)
        
        var count = 0
        while(prod > 0) {
            prod -= a
            count += 1
        }
        
        return count * mult * amult
    }
}

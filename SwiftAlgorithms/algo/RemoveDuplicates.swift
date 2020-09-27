//
//  RemoveDuplicates.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/26/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = nums.count - 2
        while(i >= 0) {
            if(nums[i] == nums[i + 1]) { nums.remove(at: i + 1) }
            i -= 1
        }
        return nums.count
    }
}

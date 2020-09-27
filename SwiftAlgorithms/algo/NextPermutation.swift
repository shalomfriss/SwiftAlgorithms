//
//  NextPermutation.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/12/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        //If there is only one element return
        if(nums.count == 1 || nums.count == 0) { return }
        
        //Find the first decreasing index from the back
        var i = nums.count - 1
        while(i > 0 && nums[i] <= nums[i - 1]) { i -= 1 }
        if(i == 0) { nums.reverse(); return }
        
        let sub = Array(nums[i...nums.count - 1]).reversed()
        let next = Array(sub).index(where: { $0 > nums[i - 1] })! + i
        nums.replaceSubrange(i..<nums.count, with: sub)
        nums.swapAt(i - 1, next)//nums.firstIndex(of: next)!)
    }
}

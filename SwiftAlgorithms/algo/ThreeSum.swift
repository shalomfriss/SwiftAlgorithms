//
//  ThreeSum.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/26/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class ThreeSum {
    var sortNums:[Int] = [Int]()
    var results = Set<[Int]>()
    var hash = [Int:Int]()
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        sortNums = nums.sorted()
        
        for x in 0..<sortNums.count {
            if let hashItem = hash[sortNums[x]] {
                hash[sortNums[x]] = hashItem + 1
            } else {
                hash[sortNums[x]] = 1
            }
        }
        
        for (key, value) in hash {
            findSum(key)
        }
        return Array(results)
    }
    
    func findSum(_ item:Int) {
        
        for (key, value) in hash {
            if(key == item && key != 0) { continue }
            let temp = (item + key) * -1
            
            if let hashItem = hash[temp] {
                if(temp == item && temp == key) {
                    if(hashItem > 2) {
                        let result = [item, key, temp]
                        results.insert(result.sorted())
                    }
                } else if(temp == item || temp == key) {
                    if(hashItem > 1) {
                        let result = [item, key, temp]
                        results.insert(result.sorted())
                    }
                }
                else {
                    let result = [item, key, temp]
                    results.insert(result.sorted())
                }
                
            }
        }
        
        
    }
}

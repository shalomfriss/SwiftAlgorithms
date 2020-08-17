//
//  MaximumProfitJobScheduling.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/12/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class MaximumProfitJobScheduling {
        var memo = [Set<Int>:Int]()
       var maxProfit = 0
       
       
       func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
           return getMax(startTime, endTime, profit, Set<Int>(), 0, 0)
       }
       
       func getMax(_ startTime: [Int], _ endTime: [Int], _ profit: [Int], _ inc:Set<Int>, _ currentProfit:Int, _ currentIndex:Int) -> Int {
           
           if let memval = memo[inc] {
               return memval
           }
           
           
           if(currentIndex > startTime.count - 1) {
               if(currentProfit > maxProfit) { maxProfit = currentProfit }
               return currentProfit
           }
           
           var tempMax = 0
           if(canInclude(currentIndex, inc, startTime, endTime)) {
               var inc = inc
               inc.insert(currentIndex)
               let max1 = getMax(startTime, endTime, profit, inc, currentProfit + profit[currentIndex], currentIndex + 1)
               if(max1 > tempMax) { tempMax = max1 }
               inc.remove(currentIndex)
           }
           
           let max2 = getMax(startTime, endTime, profit, inc, currentProfit, currentIndex + 1)
           if(max2 > tempMax) { tempMax = max2 }
           
           memo[inc] = tempMax
           return tempMax
       }
       
       func canInclude(_ jobIndex:Int, _ jobs:Set<Int>, _ startTime:[Int], _ endTime:[Int]) -> Bool{
           for x in jobs {
               if(doesOverlap(jobIndex, x, startTime, endTime) == true) {
                   return false
               }
           }
           return true
       }
       
       func doesOverlap(_ job1Index:Int, _ job2Index:Int, _ startTime:[Int], _ endTime:[Int]) -> Bool {
           let s1 = startTime[job1Index]
           let s2 = startTime[job2Index]
           let e1 = endTime[job1Index]
           let e2 = endTime[job2Index]
           
           if(s1 == s2 || e1 == e2) { return true }
           if(s1 > s2 && s1 < e2) { return true }
           if(s2 > s1 && s2 < e1) { return true }
           if(e2 > s1 && e2 < e1) { return true }
           if(e1 > s2 && e1 < e2) { return true }
           return false
       }
}

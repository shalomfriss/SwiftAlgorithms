//
//  NumberOfRepresentations.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/22/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

/*
 [10,10]
 [10,5,5]
 10,5,1,1,1,1,1
 10,1,1,1,1,1,1,1,1,1,1
 5,5,5,5
 5,5,5,1,1,1,1,1
 5,5,1,1,1,1,1,1,1,1,1,1
 5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
 */

class NumberOfRepresentations {
    
    var cache:[[Int]]
    init(_ denoms:[Int], _ num:Int) {
        cache = [[Int]](repeating: [Int](repeating: 0, count: denoms.count), count: num + 1)
        let theCount = countReps(num, denoms, 0)
        print("COUNT", theCount)
    }
    
    func countReps(_ num:Int, _ denoms:[Int], _ ind:Int) -> Int{
        
        if(cache[num][ind] != 0) {
            return cache[num][ind]
        }
        
        //We're at the 1's (this doesn't seem to work if the last denom is not 1)
        if(ind >= denoms.count - 1) {
            return 1
        }
        
        let currentItem = denoms[ind]
        var theCount = 0
        var i = 0
        while(num - i*currentItem >= 0) {
            print("Num", num - i*currentItem)
            let temp = countReps(num - i*currentItem, denoms, ind + 1)
            cache[num][ind] = temp
            theCount += temp
            i += 1
        }
        
        return theCount
    }
}

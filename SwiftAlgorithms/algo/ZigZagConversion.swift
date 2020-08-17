//
//  ZigZagConversion.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/11/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/zigzag-conversion/
class ZigZagConversion {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if(numRows == 1) { return s }
        let chars = Array(s)
        var arr = Array(repeating: [Character](), count: numRows)
        
        var arrayIndex = 0
        var dir = -1
        
        for i in 0..<chars.count {
            arr[arrayIndex].append(chars[i])
            
            if((arrayIndex + 1) % numRows == 0 || arrayIndex == 0) {
                dir *= -1
            }
            arrayIndex += dir
        }
        
        var str = ""
        for x in arr {
            str += String(x)
        }
        
        return str
    }
}

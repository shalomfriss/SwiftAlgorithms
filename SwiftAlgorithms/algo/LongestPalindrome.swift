//
//  LongestPalindrome.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/10/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

//Find the longest palindrom
class LongestPalindrome {
    
    var lowIndex:Int    = 0
    var highIndex:Int   = 0
    var maxPalindrome   = 0
    
    public func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        let chars = Array(s)
        highIndex = chars.count
        
        for i in 0..<chars.count {
            checkPalindrome(chars, i, i)
            //In the case that it is an even numbered palindrome
            checkPalindrome(chars, i, i+1)
        }
        
        return String(chars[lowIndex...highIndex])
    }
    
    func checkPalindrome(_ chars:[Character], _ startLeft:Int, _ startRight:Int) {
        var i = startLeft
        var j = startRight
        
        while i >= 0, j < chars.count, chars[i] == chars[j] {
            i -= 1
            j += 1
        }
        
        //Check for the max and save the indices ( The upper index could have been calculated using the higher index, but I kept it for verbosity )
        if(j - i - 1 > maxPalindrome) {
            maxPalindrome = j - i - 1
            lowIndex = i + 1
            highIndex = j - 1
        }
    }
    
}


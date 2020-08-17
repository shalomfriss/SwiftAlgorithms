//
//  NumbersIntoWords.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/17/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation
/**
 
 Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

 Example 1:

 Input: 123
 Output: "One Hundred Twenty Three"
 Example 2:

 Input: 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 Example 3:

 Input: 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 Example 4:

 Input: 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 
 */
class NumbersIntoWords {
        var numWords = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
        var teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
        var tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        var huns = ["", "Thousand", "Million", "Billion", "Trillion"]
    
    func numberToWords(_ num: Int) -> String {
        
        var pref = ""
        if(num < 0) { pref = "Negative " }
        if(num == 0) { return "Zero" }
        //Split to digits
        var nums = [Int]()
        var num = abs(num)
        
        while(num > 0) {
            nums.append(num % 10)
            num = num / 10
        }
        
        
        var terms = [String]()
        var i = 0
        var mills = 0
        while(i + 2 < nums.count) {
            terms.append( getTerm( Array(nums[i...(i + 2)]), mills) )
            i += 3
            mills += 1
        }
        
        if(i < nums.count) {
            terms.append(getTerm( Array(nums[i..<(nums.count)]), mills) )
        }
        
        
        terms = terms.reversed()
        var result = ""
        for i in 0..<terms.count {
                result += terms[i] + " "
        }
        
        result = pref + result.trimmingCharacters(in: .whitespacesAndNewlines)
        var temp = result.components(separatedBy: " ")
        temp = temp.filter { $0 != ""  }
        return temp.joined(separator: " ")
    }
    
    //Num a three digit number backwards (0 is the lowest digit)
    func getTerm(_ num:[Int], _ mult:Int) -> String {
        
        var num = num
        for i in (0...(num.count  - 1)).reversed() {
            if(num[i] == 0) { num.remove(at: i) }
            else { break }
        }
        
        if(num.count == 0) { return "" }
        
        if(num.count == 1) {
            return  numWords[num[0]] + " " + huns[mult]
        } else if(num.count == 2) {
            if(num[1] == 1) {
                return teens[num[0]] + " " + huns[mult]
            } else {
                return tens[num[1]] + (num[0] == 0 ? "" : " " + numWords[num[0]]) + " " + huns[mult]
            }
        }
        
        var hundred = numWords[num[2]] + " " + "Hundred"
        if(num[1] == 1) {
            hundred += " " + teens[num[0]]
        } else {
            if(num[1] > 0) {
                hundred += " " + tens[num[1]]
            }
            if(num[0] != 0) {
                hundred += " " + numWords[num[0]]
            }
        }
        
        
        hundred += " " + huns[mult]
        return hundred
    }
}


/*
2 ^ 31 - 1

2^10 = 1024
2^20 = 1,000,000
3^20 = 1,000,000,000
*/

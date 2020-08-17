//
//  RegexMatching.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/18/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

/**
    Implement the . and * regex operators
        . matches a single character
        * matches zero or more of the preceding character
 
 */
class RegexMatching {
    var ind:Int = 0
    var inputChars:[Character] = [Character]()
    var regexChars:[Character] = [Character]()
    var memory = [[Int]]()
    
    public func match(_ inputString:String, _ regexString:String) -> Bool {
        inputChars  = Array(inputString)
        regexChars  = Array(regexString)
        memory      = Array(repeating: Array(repeating: -1, count: regexChars.count + 1), count: inputChars.count + 1)
        
        return matcher(0, 0)
    }
    
    private func matcher(_ inputIndex:Int, _ regexIndex:Int) -> Bool {
        if(memory[inputIndex][regexIndex] != -1) {
            return (memory[inputIndex][regexIndex] == 1 ? true : false)
        }
        
        if(regexIndex >= regexChars.count || inputIndex >= inputChars.count) {
            if(inputIndex == inputChars.count && regexIndex == regexChars.count) {
                return true
            }
            return false
        }
        
        let char = regexChars[regexIndex]
        if(regexIndex < regexChars.count - 1) {
            let nextChar = regexChars[regexIndex + 1]
            if(nextChar == "*") {
                var temp1 = matcher(inputIndex, regexIndex + 2)
                
                var tempIndex = inputIndex
                
                if(char == ".") {
                    while(tempIndex < inputChars.count) {
                        temp1 = matcher(tempIndex + 1, regexIndex + 2) || temp1
                        tempIndex += 1
                    }
                } else {
                    print(tempIndex, inputChars.count)
                    while(inputChars[tempIndex] == char && tempIndex < inputChars.count) {
                        temp1 = matcher(tempIndex + 1, regexIndex + 2) || temp1
                        tempIndex += 1
                    }
                }
                
                memory[inputIndex][regexIndex] = (temp1 == true ? 1 : 0)
                return temp1
            }
        }
        
        
        if(inputChars[inputIndex] == char || char == ".") {
            let aMatch = matcher(inputIndex + 1, regexIndex + 1)
            memory[inputIndex][regexIndex] = (aMatch == true ? 1 : 0)
            return aMatch
        }
        
        memory[inputIndex][regexIndex] = 0
        return false
    }
}

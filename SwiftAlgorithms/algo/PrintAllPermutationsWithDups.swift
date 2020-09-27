//
//  PrintAllPermutations.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/22/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

//INCORRECT ADD HASH TABLE
class PrintAllPermutationsWithDups {
    init(str:String) {
        printPerm("", str, [Character:Bool]())
    }
    
    func printPerm(_ str:String, _ remainder:String, _ letterArray:[Character:Bool])  {
        if(remainder.count == 1) {
            print(str + remainder)
        }
        
        for (i, c) in remainder.enumerated() {
            if(letterArray[c] == true) {
                continue
            }
            var letterArray = letterArray
            letterArray[c] = true
            var newStr = remainder
            let ind = newStr.index(newStr.startIndex, offsetBy: i)
            newStr.remove(at: ind)
            printPerm(str + String(c), newStr, letterArray)
        }
        
    }
}

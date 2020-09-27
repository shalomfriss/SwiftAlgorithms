//
//  PrintAllPermutations.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/22/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class PrintAllPermutations {
    init(str:String) {
        printPerm("", str)
    }
    
    func printPerm(_ str:String, _ remainder:String)  {
        if(remainder.count == 1) {
            print(str + remainder)
        }
        
        for (i, c) in remainder.enumerated() {
            var newStr = remainder
            let ind = newStr.index(newStr.startIndex, offsetBy: i)
            newStr.remove(at: ind)
            printPerm(str + String(c), newStr)
        }
        
    }
}

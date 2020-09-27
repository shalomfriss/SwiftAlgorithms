//
//  EightQueensProblem.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 9/27/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

//print all solutions to eight queens problem
class EightQueensProblem {
    var rows = Array(repeating: 0, count: 8)
    var solutionCount = 0
    
    func solve() {
        backtrack(0)
    }
    
    func backtrack(_ column:Int) {
        if(column == 8) {
            solutionCount += 1
            let spacer = solutionCount < 10 ? " " : ""
            print("\(solutionCount)\(spacer): ", terminator: "")
            for column in 0..<8 {
                print(" \(rows[column] + 1)", terminator: "")
            }
            print("")
        }
        
        for row in 0..<8 {
            if(canPlace(row, column)) {
                rows[column] = row
                backtrack(column + 1)
            }
        }
    }


    func canPlace(_ r:Int, _ c:Int) -> Bool {
        for previousColumn in 0..<c {
            if(rows[previousColumn] == r || abs(rows[previousColumn] - r) == abs(previousColumn - c)) { return false }
        }
        
        return true
    }

    
    
    
}

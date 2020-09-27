//
//  ListAllSubsets.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/12/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class ListAllSubsets {
    var subset = [Int]()
    
    func list(_ n:Int, _ k:Int = 1) {
        if(k == n + 1) {
            print(subset)
        } else {
            subset.append(k)
            list(n, k + 1)
            subset.removeLast()
            list(n, k + 1)
        }
    }
    
    
}

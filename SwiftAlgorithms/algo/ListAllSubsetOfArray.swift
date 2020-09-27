//
//  ListAllSubsetOfArray.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/13/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation
class ListAllSubsetsOfArray {
    public func list(_ arr:[Int]) {
        
        let n = arr.count
        let n2 = UInt(pow(Double(2), Double(n)))
        
        for i:UInt in 0..<n2 {
            var subset = [Int]()
            for j:UInt in 0..<UInt(arr.count) {
                if(i & (1<<j) != 0) {
                    subset.append(arr[Int(j)])
                }
            }
            print(subset)
        }
    }
}

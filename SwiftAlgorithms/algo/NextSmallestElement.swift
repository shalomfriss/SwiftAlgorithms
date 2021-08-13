//
//  NextSmallestElement.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/14/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

class NextSmallestElement {
    
    init(_ arr:[Int]) {
        var stack:[Int] = [Int]()
        var map:[Int:Int] = [Int:Int]()
        
        stack.append(0)
        
        for i in 1..<arr.count {
            if(stack.count == 0) {
                stack.append(i)
                continue
            }
            
            /* if stack is not empty, then
                   pop an element from stack.
                   If the popped element is greater
                   than next, then
                a) print the pair
                b) keep popping while elements are
                greater and stack is not empty
            */
            while(stack.count > 0 && arr[stack[stack.count - 1]] > arr[i]) {
                map[stack[stack.count - 1]] = i
                stack.removeLast()
            }
            
            /* push next to stack so that we can find
                next smaller for it
            */
            stack.append(i)
        }
        
        /* After iterating over the loop, the remaining
          elements in stack do not have the next smaller
          element, so print -1 for them
        */
        while(stack.count > 0) {
            map[stack[0]] = -1
            stack.removeFirst()
        }
        
        for i in 0..<arr.count {
            print("\(arr[i]) --> \(map[i]! == -1 ? "-1" : String(describing: arr[map[i]!]))")
        }
    }
}

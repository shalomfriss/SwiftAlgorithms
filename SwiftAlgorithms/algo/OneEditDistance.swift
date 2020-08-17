//
//  OneEditDistance.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/15/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class OneEditDistance {
    /**
    The strings can't be one charater different in length otherwise we need two edits
    After that if the strings arent' equal in length remove the first character that isn't equal
     from the longer string
     then just compare the two strings
     */
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        if(s == "" && t == "") { return false }
        if(abs(s.count - t.count) > 1) { return false }
        if(s == t) { return false }
        if(s.count == 1 && t.count == 1) { return true }
        
        var a = s.count >= t.count ? Array(s) : Array(t)
        let b = s.count >= t.count ? Array(t) : Array(s)
        
        var diff = 0
        if(a.count != b.count) {
            diff += 1
            for i in 0..<b.count {
                if(a[i] != b[i]) {
                    a.remove(at: i)
                    break
                }
            }
        }
        
        for i in 0..<b.count {
            if(a[i] != b[i]) {
                diff += 1
            }
        }
        
        if(diff > 1) { return false }
        return true
        
    }
    
   
}

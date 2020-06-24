//
//  PrintParens.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/22/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class PrintParens {
    init(num:Int) {
        print(getParent(num))
    }
    
    func getParent(_ num:Int) -> Set<String> {
        if(num == 1) {
            return ["()"]
        }
        
        let parens = getParent(num - 1)
        var results = Set<String>()
        for i in parens {
            results.insert("()" + i)
            results.insert(i + "()")
            results.insert("(" + i + ")")
        }
        
        return results
    }
}

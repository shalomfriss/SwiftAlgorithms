//
//  Tree.swift
//  SwiftAlgorithms
//
//  Created by user on 11/3/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class Tree<T> {
    public var value:T
    public var parent:Tree?
    public var children:[Tree]?
    
    public init(value: T) {
        self.value = value
    }
    
}

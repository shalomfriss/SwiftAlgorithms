//
//  Graph.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 7/1/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class GraphNode {
    
    var value:Int
    var children:[GraphNode]
    var visited:Bool = false
    
    init(value:Int) {
        self.value = value
        children = [GraphNode]()
    }
    
    public func addChild(aChild:GraphNode) {
        self.children.append(aChild)
    }
    
    public func removeChild(aValue:Int) {
        for x in (0..<children.count).reversed() {
            if(children[x].value == aValue) {
                children.remove(at: x)
            }
        }
    }
    
    public func dfs(proc:(GraphNode) -> Void) {
        var stack = [GraphNode]()
        stack.append(self)
        
        while(stack.isEmpty == false) {
            if let theItem = stack.popLast() {
                theItem.visited = true
                proc(theItem)
                for x in theItem.children {
                    stack.append(x)
                }
            }
        }
    }
    
    public func bfs(proc:(GraphNode) -> Void) {
        var queue = [GraphNode]()
        queue.append(self)
        
        while(queue.isEmpty == false) {
            if let theItem = queue.popLast() {
                proc(theItem)
                for x in theItem.children {
                    queue.insert(x, at: 0)
                }
            }
        }
    }
}


class Graph {
    var root:GraphNode
    
    init(root:GraphNode) {
        self.root = root
    }
    
    public func bfs(proc:(GraphNode) -> Void) {
        root.bfs(proc: proc)
    }
    
    public func dfs(proc:(GraphNode) -> Void) {
        root.dfs(proc: proc)
    }
    
    public func search(aValue:Int) -> GraphNode? {
        var foundNode:GraphNode? = nil
        root.bfs(proc: {node in
            if(node.value == aValue) {
                foundNode = node
            }
        })
        return foundNode
    }
}

//
//  Graph.swift
//  SwiftAlgorithms
//
//  Created by user on 11/12/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

class GraphNode<T:Comparable> {
    var nodes = [GraphNode<T>]()
    var key:T
    var visited:Bool = false
    
    init(key:T) {
        self.key = key
    }
    
    public func add(node: GraphNode<T>) {
        nodes.append(node)
        
    }
    
    /*
    public func remove(node: GraphNode<T>) -> GraphNode<T>? {
        
    }
    
    public func find(key:T, bsf:Bool = false) -> GraphNode<T>? {
        
    }
    */
    
    public func BFS(key:T) -> GraphNode<T>? {
        var queue = Queue<GraphNode<T>>()
        queue.push(item: self)
        
        while(queue.notEmpty()) {
            let item = queue.pop()!
            if(item.visited == true) {
                continue
            }
            
            item.visited = true
            if(key == item.key) {
                return item
            }
            
            for x in nodes {
                queue.push(item: x)
            }
        }
        
        return nil
    }
    
    
    public func DFS(key:T) -> GraphNode<T>? {
        var queue = Stack<GraphNode<T>>()
        queue.push(item: self)
        
        while(queue.notEmpty()) {
            let item = queue.pop()!
            if(item.visited == true) {
                continue
            }
            
            item.visited = true
            if(key == item.key) {
                return item
            }
            
            for x in nodes {
                queue.push(item: x)
            }
        }
        
        return nil
    }
    
    
}

class Graph<T:Comparable> {
    //var root:GraphNode<T:Comparable>?
    
    
    
    init() {}
}

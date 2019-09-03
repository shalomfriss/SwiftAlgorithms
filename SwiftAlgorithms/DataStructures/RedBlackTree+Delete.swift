//
//  RedBlackTree+Delete.swift
//  SwiftAlgorithms
//
//  Created by user on 11/13/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

extension RedBlackTree {
    
    public func delete(node:RBNode<T>) {
        
        var newNode:RBNode<T> = node
        if(node.left != nil){
            newNode = node.maxNode(node: node.left!)
        } else if(node.right != nil) {
            newNode = node.minNode(node: node.right!)
        } else {
            if(node.isLeft) {
                node.parent?.left = nil
            } else {
                node.parent?.right = nil
            }
            return
        }
        
        node.value = newNode.value
        delete(node: newNode)
        
        
        if(node.color == .red) {
            return
        }
        
        node.parent = nil
        node.left = nil
        node.right = nil
    }
    
    private func fixDelete(node: RBNode<T>) {
        
    }
}

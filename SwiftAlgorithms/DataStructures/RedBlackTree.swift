//
//  RedBlackTree.swift
//  SwiftAlgorithms
//
//  Created by user on 11/11/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

enum RBTColor {
    case red
    case black
}



class RBNode<T:Comparable> {
    public var value:T
    public var color:RBTColor = .red
    
    public var parent:RBNode?
    public var left:RBNode?
    public var right:RBNode?
    
    init(value:T) {
        self.value = value
    }
    
    init(value:T, color: RBTColor, left:RBNode?, right:RBNode?, parent:RBNode?) {
        self.value = value
        self.color = color
        self.left = left
        self.right = right
        self.parent = parent
    }
    
    public var isRoot:Bool {
        return parent == nil
    }
    
    public var isLeft:Bool {
        return parent?.left === self
    }
    
    public var isRight:Bool {
        return parent?.right === self
    }
    
    public func insert(value:T) -> RBNode<T> {
        if(value < self.value){
            if(left != nil) {
                return left!.insert(value: value)
            } else {
                left = RBNode(value: value, color: .red, left: nil, right: nil, parent: self)
                return left!
            }
        } else {
            if(right != nil) {
                return right!.insert(value: value)
            } else {
                right = RBNode(value: value, color: .red, left: nil, right: nil, parent: self)
                return right!
            }
        }
    }
    
}


class RedBlackTree<T:Comparable> {
    
    var root:RBNode<T>!
    init() {
        
    }
    
    init(value:T) {
        root = RBNode(value: value)
        root.color = .black
    }
    
    
    /******************************************/
    //UTIL
    /******************************************/
    //MARK:- INSERT
    public func insert(value:T) -> RBNode<T> {
        
        if(root == nil) {
            root = RBNode(value: value)
            root.color = .black
            return root!
        }
        
        //node is not root
        let node = root.insert(value: value)
        insertFix(node: node)
        
        return node
        
    }
    
    public func insertFix(node: RBNode<T>?) {
        
        guard let node = node else {
            return
        }
        
        if(node.isRoot) {
            node.color = .black
            return
        }
        
        
        
        if let grandParent = node.parent?.parent {
            
            var uncle = grandParent.right
            if(node.parent?.isLeft == true) {
                uncle = grandParent.left
            }
            
            if(uncle != nil) {
                if(uncle?.color == .red){
                    insertCaseA(node: node)
                } else {
                    insertCaseB(node: node)
                }
            } else {
                insertCaseB(node: node)
            }
            
        } else {
            return
        }
        
    }
    
    public func insertCaseA(node: RBNode<T>?) {
        print("CASE A")
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        print(node.value)
        
        var uncle = nodeGrand.right
        if(nodeParent.isLeft == true) {
            uncle = nodeGrand.left
        }
        
        if(uncle == nil) {
            return
        }
        
        nodeParent.color = .black
        uncle?.color = .black
        nodeGrand.color = .red
        
        insertFix(node: nodeGrand)
    }
    
    //Uncle is black (meaning either black or nil, since nil is considered black)
    public func insertCaseB(node:RBNode<T>?) {
        print("CASE B")
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        var uncle = nodeGrand.right
        if(nodeParent.isLeft == true) {
            uncle = nodeGrand.left
        }
        
       
        if(nodeParent.isLeft && node.isLeft) {
            insertCaseLL(node: node)
        }
        
        if(nodeParent.isLeft && node.isRight) {
            insertCaseLR(node: node)
        }
        
        if(nodeParent.isRight && node.isRight) {
            insertCaseRR(node: node)
        }
        
        if(nodeParent.isRight && node.isLeft) {
            insertCaseRL(node: node)
        }
        
    }
    
    
    
    //Specifics
    public func insertCaseLL(node:RBNode<T>?) {
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        let color = nodeParent.color
        nodeParent.color = nodeGrand.color
        nodeGrand.color = color
        rotateRight(node: nodeGrand)
    }
    
    public func insertCaseLR(node:RBNode<T>?) {
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        rotateLeft(node: nodeParent)
        insertCaseLL(node: nodeParent)
    }
    
    public func insertCaseRR(node:RBNode<T>?) {
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        let color = nodeParent.color
        nodeParent.color = nodeGrand.color
        nodeGrand.color = color
        rotateLeft(node: nodeGrand)
        
    }
    
    public func insertCaseRL(node:RBNode<T>?) {
        guard let node = node, let nodeParent = node.parent, let nodeGrand = nodeParent.parent else {
            return
        }
        
        rotateRight(node: nodeParent)
        insertCaseRR(node: nodeParent)
    }
    
    /******************************************/
    //UTIL
    /******************************************/
    
    public func rotateRight(node:RBNode<T>) {
        guard let nodeLeft = node.left else {
            return
        }
        
        node.left = nodeLeft.right
        node.left?.parent = node
        
        nodeLeft.right = node
        
        if(node.isLeft) {
            node.parent?.left = nodeLeft
        } else {
            node.parent?.right = nodeLeft
        }
        
        nodeLeft.parent = node.parent
        node.parent = nodeLeft
        
        if(nodeLeft.parent == nil)
        {
            root = nodeLeft
        }
    }
    
    public func rotateLeft(node:RBNode<T>) {
        guard let nodeRight = node.right else {
            return
        }
        
        node.right = nodeRight.left
        node.right?.parent = node
        
        nodeRight.left = node
        
        if(node.isLeft) {
            node.parent?.left = nodeRight
        } else {
            node.parent?.right = nodeRight
        }
        
        nodeRight.parent = node.parent
        node.parent = nodeRight
        
        if(nodeRight.parent == nil)
        {
            root = nodeRight
        }
    }
    
    
    //MARK:-UTIL
    public func printme() {
        guard let root = root else {
            print("*********************")
            print("No root: The tree is empty")
            print("*********************")
            return
        }
        
        print("*********************")
        let queue = Queue<RBNode<T>?>()
        
        queue.push(item: root)
        queue.push(item: nil)
        
        var str = ""
        while(queue.notEmpty()) {
            
            let temp = queue.pop()
            guard let itemx = temp, let item = itemx else {
                print(str)
                print("\n-------------------------------\n")
                str = ""
                
                if(queue.notEmpty() == false){
                    return
                }
                
                queue.push(item: nil)
                continue
            }
            
            str += "\(item.value)-\(item.color), "
            
            if(item.left != nil) {
                queue.push(item: item.left)
            }
            if(item.right != nil) {
                queue.push(item: item.right)
            }
        }
        
        
    }
    
    
    
}

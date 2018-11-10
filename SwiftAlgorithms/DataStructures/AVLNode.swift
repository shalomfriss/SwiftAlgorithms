//
//  AVLTree.swift
//  SwiftAlgorithms
//
//  Created by user on 11/3/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation
class AVLNode<T:Comparable> {
    
    public var treeRoot:AVLNode!
    
    public var value:T
    public var parent:AVLNode?
    public var left:AVLNode?
    public var right:AVLNode?
    
    public var height:Int = 0
    
    public var printHeight = 0
    
    public init(value: T) {
        self.value = value
    }
    
    //MARK:- Helpers
    public var isLeaf:Bool {
        return left == nil && right == nil
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
    
    public func minimum() -> AVLNode {
        return self.left?.minimum() ?? self
    }
    
    public func maximum() -> AVLNode {
        return self.right?.maximum() ?? self
    }
    
    public func getRoot() -> AVLNode {
        var parent = self
        while(parent.parent != nil) {
            parent = parent.parent!
        }
        return parent
    }
    
    //MARK:- Insert, Delete, Search
    public func insert(value: T) {
        if(value < self.value) {
            if let leftChild = left {
                leftChild.insert(value: value)
            } else {
                left = AVLNode(value: value)
                left?.parent = self
                left?.treeRoot = self.treeRoot
                //printme(aNode: treeRoot)
                updateHeightUpwards(node: left)
            }
        } else {
            if let rightChild = right {
                rightChild.insert(value: value)
            } else {
                right = AVLNode(value: value)
                right?.parent = self
                right?.treeRoot = self.treeRoot
                //printme(aNode: treeRoot)
                updateHeightUpwards(node: right)
            }
        }
        
        if let parent = self.parent {
            //balance(node: parent)
        }
        
       
        //var parent = self.parent
        //balance(node: parent)
        /*
        while(parent != nil){
            if(abs(lrDiff(node: parent!)) > 1) {
                balance(node: parent)
            }
            parent = parent?.parent
        }
        */
    }
    
    public func getBalance() -> Int {
        return lrDiff(node: self)
    }
    
    public func getHeight(node:AVLNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return max(getHeight(node: node.left), getHeight(node: node.right)) + 1

    }
    
    public func search(value: T) -> AVLNode? {
        if(self.value == value) { return self }
        
        if(value < self.value) {
            if let leftChild = left {
                return leftChild.search(value: value)
            }
            return nil
        } else {
            if let rightChild = right {
                return rightChild.search(value: value)
            }
            return nil
        }
    }
    
    public func remove() {
        var replacement:AVLNode!
        
        if(self.isLeaf == true)
        {
            if(self.isLeft == true) {
                self.parent?.left = nil
            } else {
                self.parent?.right = nil
            }
            balance(node: self.parent)
        } else {
            if(left != nil) {
                replacement = self.left?.maximum()
            } else if(right != nil) {
                replacement = self.right?.minimum()
            } else {
                replacement = nil
            }
        }
        
        if(self.isLeft == true) {
            self.parent?.left = replacement
        } else {
            self.parent?.right = replacement
        }
        
    }
    
    //MARK:- Balance related
    private func lrDiff(node:AVLNode) -> Int {
        let leftHeight = node.left?.height ?? 0
        let rightHeight = node.right?.height ?? 0
        //return leftHeight - rightHeight
        
        return getHeight(node: node.left) - getHeight(node: node.right)
    }
    
    
    public func updateHeightUpwards(node:AVLNode?) {
        if let node = node {
            
            let lHeight = node.left?.height ?? 0
            let rHeight = node.right?.height ?? 0
            node.height = max(lHeight, rHeight) + 1
            
            updateHeightUpwards(node: node.parent)
        }
    }
    
    
    /*
     
      a
     / \
    b   e
   /
  c
 /
d
     
     
     
     */
    
    
    //MARK:- rotation
    
    /*
 
      z                                      y
     / \                                   /   \
    y   T4      Right Rotate (z)          x      z
   / \          - - - - - - - - ->      /  \    /  \
  x   T3                               T1  T2  T3  T4
 / \
T1   T2

 */
    public func rotateRight(node:AVLNode?) {
        guard let node = node, let nodeLeft = node.left else {
            fatalError("COULD NOT ROTATE")
        }
        
        let leftRight = nodeLeft.right
        
        //Update the left branch of node
        node.left = leftRight
        leftRight?.parent = node
        
        //Update the right side of the left node of node
        nodeLeft.right = node
        nodeLeft.parent = node.parent
        
        if(node.parent != nil) {
            if(node.isLeft == true) {
                node.parent?.left = nodeLeft
            } else {
                node.parent?.right = nodeLeft
            }
        }
        node.parent = nodeLeft
        
        
        //updateHeightUpwards(node: node)
        
    }
    
    /*
    z                                y
   /  \                            /   \
  T1   y     Left Rotate(z)       z      x
      /  \   - - - - - - - ->    / \    / \
     T2   x                     T1  T2 T3  T4
         / \
        T3  T4
 */
    public func rotateLeft(node: AVLNode?) {
        guard let node = node, let nodeRight = node.right else {
            fatalError("COULD NOT ROTATE")
        }
        let rightLeft = nodeRight.left
        
        node.right = rightLeft
        rightLeft?.parent = node
        
        nodeRight.left = node
        nodeRight.parent = node.parent
        
        if(node.parent != nil) {
            if(node.isLeft == true) {
                node.parent?.left = nodeRight
            } else {
                node.parent?.right = nodeRight
            }
        }
        node.parent = nodeRight
        
        //updateHeightUpwards(node: node)
    }
    
    
    
    public func rotateLL(node:AVLNode) {
        print("Rotate LL")
        rotateRight(node: node)
    }
    
    public func rotateLR(node:AVLNode) {
        print("Rotate LR")
        rotateLeft(node: node.left)
        rotateRight(node: node)
    }
    
    public func rotateRR(node:AVLNode) {
        print("Rotate RR")
        rotateLeft(node: node)
    }
    
    public func rotateRL(node:AVLNode) {
        print("Rotate RL")
        rotateRight(node: node.right)
        rotateLeft(node: node)
    }
    
    
    
    
    public func balance(node:AVLNode?) {
        guard let root = node else {
            return
        }
        
        
        
        print("DIFF: \(lrDiff(node: root))")
        //Left side
        if(lrDiff(node: root) > 1) {
            guard let pivot = root.left else {
                print("ERROR BALANCING TREE")
                return
            }
            
            //Left-left
            if(lrDiff(node: pivot) > 0) {
                rotateLL(node: root)
            }
                //Left-right
            else {
                rotateLR(node: root)
            }
            
        }
            //Right side
        else if(lrDiff(node: root) < -1) {
            guard let pivot = root.right else {
                print("ERROR BALANCING TREE")
                return
            }
            
            //Right-right
            if(lrDiff(node: pivot) < 0) {
                rotateRR(node: root)
            }
            //Right-left
            else {
                rotateRL(node: root)
            }
        } else {
            balance(node: root.parent)
        }
        
        
        //updateHeightUpwards(node: root.left)
        //updateHeightUpwards(node: root.right)
        //balance(node: root.parent)
    }
    
    
    
    //MARK:-PRINTING
    
    private func setReferences(root:AVLNode, pivot:AVLNode, rotationSubtree:AVLNode) {
        
    }
    
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }
    
    public func printTree() {
        var parent = self
        
        while(parent.parent != nil) {
            parent = parent.parent!
        }
        printme(aNode: parent)
    }
    
    public func printme(aNode:AVLNode? = nil) {
        
        var pNode = (aNode == nil) ? self : aNode!
    
        
        var que = Queue<AVLNode>()
        pNode.printHeight = 0
        que.push(item: pNode)
        
        
        var arr = [[Int]]()
        while(que.notEmpty() == true) {
            guard let node = que.pop() else { break }
            
            
            if(arr.count < node.printHeight + 1) {
                arr.append([Int]())
            }
            arr[node.printHeight].append(node.value as! Int)
            
            if let left = node.left {
                left.printHeight = node.printHeight + 1
                que.push(item: left)
            }
            if let right = node.right {
                right.printHeight = node.printHeight + 1
                que.push(item: right)
            }
            
            
            
        }
        
        
        print("***********************************************")
        for i in 0..<arr.count {
            var str = ""
            for j in 0..<arr[i].count {
                if(arr[i][j] == -1) {
                    str.append(contentsOf: " | ")
                } else {
                    str.append(contentsOf: "\(arr[i][j]), ")
                }
            }
            print(str)
            print("---------------------------")
        }
        print("***********************************************")
    }
    
    
}

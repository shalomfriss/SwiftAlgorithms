//
//  AVLTree.swift
//  SwiftAlgorithms
//
//  Created by user on 11/10/18.
//  Copyright © 2018 Shalom Friss. All rights reserved.
//

import Foundation

//https://www.geeksforgeeks.org/avl-tree-set-1-insertion/

class AVNode<T:Comparable> {
    var key:T
    var height: Int = 1
    var left:AVNode?
    var right: AVNode?
    
    init(key:T) {
        self.key = key
    }
}

class AVLTree<T:Comparable> {
    var root:AVNode<T>?
    
    public func height(node:AVNode<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return node.height
    }
    
    public func rightRotate(y:AVNode<T>) -> AVNode<T> {
        guard let x = y.left else {
            fatalError("COULD NOT RIGHT ROTATE")
        }
        let T2 = x.right
        
        x.right = y
        y.left = T2
        
        y.height = max(height(node: y.left), height(node: y.right)) + 1
        x.height = max(height(node: x.left), height(node: x.right)) + 1
        return x
    }
    
    public func leftRotate(x:AVNode<T>) -> AVNode<T> {
        guard let y = x.right else {
            fatalError("COULD NOT RIGHT ROTATE")
        }
        let T2 = y.left
        
        y.left = x;
        x.right = T2;
        
        x.height = max(height(node:x.left), height(node:x.right)) + 1
        y.height = max(height(node:y.left), height(node:y.right)) + 1
        
        return y
    }
    
    public func getBalance(node:AVNode<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return height(node: node.left) - height(node: node.right)
    }
    
    public func insert(node:AVNode<T>?, key:T) -> AVNode<T> {
        guard let node = node else {
            return AVNode(key: key)
        }
        
        if(key < node.key) {
            node.left = insert(node: node.left, key: key)
        } else if(key > node.key) {
            node.right = insert(node: node.right, key: key)
        } else {
            return node
        }
        
        node.height = max(height(node: node.left), height(node: node.right)) + 1
        let balance = getBalance(node: node)
        
        if(balance > 1) {
            //Left Left Case
            if(key < (node.left?.key)!) {
                return rightRotate(y: node)
            }
            
            //Left Right Case
            if(key > (node.left?.key)!) {
                node.left = leftRotate(x: node.left!);
                return rightRotate(y: node);
            }
        }
        
        if (balance < -1) {
            //Right right case
            if(key > (node.right?.key)!) {
                return leftRotate(x: node)
            }
            
            //Right left case
            if(key < (node.right?.key)!) {
                node.right = rightRotate(y: node.right!)
                return leftRotate(x: node);
            }
        }
        
        return node
    }
    
    public func printme() {
        guard let root = root else {
            print("*********************")
            print("No root: The tree is empty")
            print("*********************")
            return
        }
        
        print("*********************")
        let queue = Queue<AVNode<T>>()
        let printQueue = Queue<AVNode<T>>()
        
        queue.push(item: root)
        
        var items = [Int:[Int]]()
        
        while(queue.notEmpty()) {
            let item = queue.pop()
            printQueue.push(item: item!)
            
            if(items[(item?.height)! - 1] == nil) {
                items[(item?.height)! - 1] = [Int]()
            }
            
            items[(item?.height)! - 1]?.append(item?.key as! Int)
            
            if(item?.left != nil) {
                queue.push(item: (item?.left)!)
            }
            if(item?.right != nil) {
                queue.push(item: (item?.right)!)
            }
        }
        
        for i in (0..<items.count).reversed() {
            guard let row = items[i] else {
                continue
            }
            print("---------------------------")
            var str = ""
            for j in 0..<row.count {
                str += "\(row[j]), "
            }
            print(str)
        }
        
    }
    init() {
    }
}

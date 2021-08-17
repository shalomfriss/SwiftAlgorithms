//
//  CLRSBinarySearchTree.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 8/12/21.
//  Copyright © 2021 Shalom Friss. All rights reserved.
//

import Foundation

class BSTNode<T:Comparable,U> {
    var parent:BSTNode?
    var left:BSTNode?
    var right:BSTNode?
    var key:T
    var value:U
    
    init(_ parent:BSTNode?, _ left:BSTNode?, _ right:BSTNode?, _ key:T, _ val:U) {
        self.left = left
        self.right = right
        self.key = key
        self.value = val
    }
    
    func printTree() {
        var que = [BSTNode?]()
        que.append(self)
        que.append(nil)
        var space = ""
        
        while(que.count > 0) {
            
            let item = que.removeFirst()
            if (item?.left != nil) { que.append(item?.left!) }
            if (item?.right != nil) { que.append(item?.right!) }
            
            if(item == nil) {
                if(que.count == 0) { return }
                space = ""
                que.append(nil)
                print("")
            } else {
                print("\("   ")\(String(describing: item!.key))", terminator: "")
            }
            
            
        }
    }
    
    func getRandomTree() -> BSTNode<Int, Int> {
        let root = BSTNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
        for _ in 1...20 {
            let temp = BSTNode<Int, Int>(nil, nil, nil, Int.random(in: 0...1000), 1)
            root.insert(aNode: temp)
        }
        return root
    }
    
//    func print() {
//        Swift.print("\(key):\(value)")
//    }
    
    func inOrderTreeWalk(x:BSTNode?, block:(BSTNode?) -> Void) {
        if(x == nil) { return }
        inOrderTreeWalk(x: x?.left, block: block)
        block(x)
        inOrderTreeWalk(x: x?.right, block: block)
    }
    
    func search(aKey:T) -> BSTNode? {
        var currentNode:BSTNode? = self
        while(currentNode != nil && aKey != currentNode?.key) {
            if(aKey < currentNode!.key) { currentNode = currentNode?.left }
            else { currentNode = currentNode?.right }
        }
        return currentNode
    }
    
    func recursiveSearch(aKey:T) -> BSTNode? {
        if(aKey == self.key) { return self }
        if(left == nil && right == nil) { return nil }
        if(aKey < self.key) { return self.left?.recursiveSearch(aKey: aKey) }
        else { return self.right?.recursiveSearch(aKey: aKey) }
    }
    
    func min() -> BSTNode {
        var currentNode = self
        while let leftNode = currentNode.left { currentNode = leftNode }
        return currentNode
    }
    
    func max() -> BSTNode {
        var currentNode = self
        while let rightNode = currentNode.right { currentNode = rightNode }
        return currentNode
    }
    
    func successor() -> BSTNode? {
        if(self.right != nil) { return self.right?.min() }
        var x = self
        var y = self.parent
        while(y != nil && x === y?.right) {
            x = y!
            y = y?.parent
        }
        return y
    }
    
    func insert(aNode:BSTNode) {
        var currentNode:BSTNode? = self
        var y:BSTNode? = nil
        
        while(currentNode != nil) {
            y = currentNode
            if(aNode.key < currentNode!.key) { currentNode = currentNode?.left }
            else { currentNode = currentNode?.right }
        }
        
        aNode.parent = y
        if(aNode.key < y!.key) {
            y?.left = aNode
        } else {
            y?.right = aNode
        }
    }
    
    func transplant(_ u:BSTNode?, _ v:BSTNode?) {
        if(u === u?.parent?.left) { u?.parent?.left = v }
        else { u?.parent?.right = v }
        v?.parent = u?.parent
    }
    
    func delete(aNode:BSTNode) {
        if(aNode.left == nil) {
            transplant(aNode, aNode.right)
        } else if(aNode.right == nil) {
            transplant(aNode, aNode.left)
        } else {
            let y = aNode.right?.min()
            if(y?.parent !== aNode) {
                //Replace the current min with it's right subtree so that we don't lose it
                //Basically deleting it
                transplant(y, y?.right)
                y?.right = aNode.right
                y?.right?.parent = y
            }
            transplant(aNode, y)
            y?.left = aNode.left
            y?.left?.parent = y
        }
    }
    
}


//extension BSTNode {
//    public func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String
//    {
//       // node value string and sub nodes
//       let (stringValue, leftNode, rightNode) = nodeInfo(node)
//
//       let stringValueWidth  = stringValue.count
//
//       // recurse to sub nodes to obtain line blocks on left and right
//       let leftTextBlock     = leftNode  == nil ? []
//                             : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
//                               .components(separatedBy:"\n")
//
//       let rightTextBlock    = rightNode == nil ? []
//                             : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
//                               .components(separatedBy:"\n")
//
//       // count common and maximum number of sub node lines
//        let commonLines       = Swift.min(leftTextBlock.count,rightTextBlock.count)
//        let subLevelLines     = Swift.max(rightTextBlock.count,leftTextBlock.count)
//
//       // extend lines on shallower side to get same number of lines on both sides
//       let leftSubLines      = leftTextBlock
//                             + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
//       let rightSubLines     = rightTextBlock
//                             + Array(repeating:"", count: subLevelLines-rightTextBlock.count)
//
//       // compute location of value or link bar for all left and right sub nodes
//       //   * left node's value ends at line's width
//       //   * right node's value starts after initial spaces
//       let leftLineWidths    = leftSubLines.map{$0.count}
//       let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }
//
//       // top line value locations, will be used to determine position of current node & link bars
//       let firstLeftWidth    = leftLineWidths.first   ?? 0
//       let firstRightIndent  = rightLineIndents.first ?? 0
//
//
//       // width of sub node link under node value (i.e. with slashes if any)
//       // aims to center link bars under the value if value is wide enough
//       //
//       // ValueLine:    v     vv    vvvvvv   vvvvv
//       // LinkLine:    / \   /  \    /  \     / \
//       //
//        let linkSpacing       = Swift.min(stringValueWidth, 2 - stringValueWidth % 2)
//       let leftLinkBar       = leftNode  == nil ? 0 : 1
//       let rightLinkBar      = rightNode == nil ? 0 : 1
//       let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
//       let valueOffset       = (stringValueWidth - linkSpacing) / 2
//
//       // find optimal position for right side top node
//       //   * must allow room for link bars above and between left and right top nodes
//       //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
//       //   * can be offset to the left if lower subNodes of right node
//       //     have no overlap with subNodes of left node
//       let minSpacing        = 2
//       let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
//                               .reduce(firstLeftWidth + minLinkWidth)
//                               { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
//
//
//       // extend basic link bars (slashes) with underlines to reach left and right
//       // top nodes.
//       //
//       //        vvvvv
//       //       __/ \__
//       //      L       R
//       //
//       let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
//       let rightLinkExtra    = linkExtraWidth / 2
//       let leftLinkExtra     = linkExtraWidth - rightLinkExtra
//
//       // build value line taking into account left indent and link bar extension (on left side)
//       let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
//       let valueLine         = String(repeating:" ", count:max(0,valueIndent))
//                             + stringValue
//       let slash             = reversed ? "\\" : "/"
//       let backSlash         = reversed ? "/"  : "\\"
//       let uLine             = reversed ? "¯"  : "_"
//       // build left side of link line
//       let leftLink          = leftNode == nil ? ""
//                             : String(repeating: " ", count:firstLeftWidth)
//                             + String(repeating: uLine, count:leftLinkExtra)
//                             + slash
//
//       // build right side of link line (includes blank spaces under top node value)
//       let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
//       let rightLink         = rightNode == nil ? ""
//                             : String(repeating:  " ", count:rightLinkOffset)
//                             + backSlash
//                             + String(repeating:  uLine, count:rightLinkExtra)
//
//       // full link line (will be empty if there are no sub nodes)
//       let linkLine          = leftLink + rightLink
//
//       // will need to offset left side lines if right side sub nodes extend beyond left margin
//       // can happen if left subtree is shorter (in height) than right side subtree
//       let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
//       let leftIndent        = String(repeating:" ", count:leftIndentWidth)
//       let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
//
//       // compute distance between left and right sublines based on their value position
//       // can be negative if leading spaces need to be removed from right side
//       let mergeOffsets      = indentedLeftLines
//                               .map{$0.count}
//                               .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
//                               .enumerated()
//                               .map{ rightSubLines[$0].isEmpty ? 0  : $1 }
//
//
//       // combine left and right lines using computed offsets
//       //   * indented left sub lines
//       //   * spaces between left and right lines
//       //   * right sub line with extra leading blanks removed.
//       let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
//                               .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
//                               .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
//
//       // Assemble final result combining
//       //  * node value string
//       //  * link line (if any)
//       //  * merged lines from left and right sub trees (if any)
//       let treeLines = [leftIndent + valueLine]
//                     + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
//                     + mergedSubLines
//
//       return (reversed && isTop ? treeLines.reversed(): treeLines)
//              .joined(separator:"\n")
//    }
//}

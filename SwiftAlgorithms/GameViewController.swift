//
//  GameViewController.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 10/21/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        
        
        let tree = RedBlackTree<Int>()
        tree.insert(value: 5)
        tree.insert(value: 8)
        tree.insert(value: 10)
        tree.insert(value: 3)
        tree.insert(value: 12)
        tree.insert(value: 14)
        tree.insert(value: 7)
        tree.insert(value: 9)
        tree.insert(value: 1)
        /*
        
        
        
        
        
         */
        tree.printme()
        
        /*
        tree.rotateLeft(node: tree.root)
        tree.printme()
        tree.rotateRight(node: tree.root)
        tree.printme()
        */
 
        /*
        let heap = AlgoArray()
        heap.addItem(value: 1)
        heap.addItem(value: 5)
        heap.addItem(value: 2)
        heap.addItem(value: 3)
        heap.addItem(value: 0)
        heap.addItem(value: 10)
        heap.addItem(value: 18)
        heap.addItem(value: 3)
        heap.addItem(value: 3)
        heap.addItem(value: 0)
        heap.addItem(value: 10)
        heap.addItem(value: 18)
        heap.addItem(value: 3)
        heap.printme()
        */
        
        
        /*
        let heap = Heap()
        heap.addItem(val: 1)
        heap.addItem(val: 5)
        heap.addItem(val: 2)
        heap.addItem(val: 3)
        heap.addItem(val: 0)
        heap.addItem(val: 10)
        heap.addItem(val: 18)
        heap.addItem(val: 3)
        heap.addItem(val: 3)
        heap.addItem(val: 0)
        heap.addItem(val: 10)
        heap.addItem(val: 18)
        heap.addItem(val: 3)
        heap.print()
        
        print(heap.getTopItem())
        heap.print()
        print(heap.getTopItem())
        heap.print()
        print(heap.getTopItem())
        heap.print()
        print(heap.getTopItem())
        heap.print()
        print(heap.getTopItem())
        heap.print()
        */
        
        /*
        let tree = BinarySearchTree<Int>(value: 7)
        tree.insert(value: 5)
        tree.insert(value: 10)
        tree.insert(value: 1)
        tree.insert(value: 9)
       
        
        print("TREE")
        let result = tree.search(value: 9)
        print(result?.value)
        let result2 = tree.search(value: 15)
        print(result2)
        let result3 = tree.search(value: 10)
        print(result3?.value)
        
        print(tree.toArray())
        print(tree.height())
        
        */
        
        
        /*
        let avlTree = AVLTree<Int>()
        avlTree.root = avlTree.insert(node: nil, key: 5)
        avlTree.insert(node: avlTree.root, key: 3)
        avlTree.insert(node: avlTree.root, key: 8)
        avlTree.insert(node: avlTree.root, key: 1)
        avlTree.printme()
        */
        
        
        /*
        print("GO")
        let heap = Heap<Int>()
        heap.insert(value: 3)
        heap.insert(value: 5)
        heap.insert(value: 7)
        heap.insert(value: 2)
        heap.insert(value: 9)
        
        heap.printme()
        heap.removeRoot()
        heap.printme()
        
        heap.insert(value: 4)
        heap.printme()
        
        heap.insert(value: 10)
        heap.printme()
        
        print(heap.search(value: 10))
        print(heap.search(value: 2))
        print(heap.search(value: 5))
        print(heap.search(value: 3))
        print(heap.search(value: 4))
        print("Done")
        
        
        let arr = [2, 10, 1,4,7,3,5,9,6]
        let hs = HeapSort(array: arr)
        hs.heap.printme()
 
    */
        /*
        print("AVL------------------")
        let avl = AVLNode(value: 6)
        avl.insert(value: 5)
        avl.insert(value: 3)
        avl.insert(value: 1)
        avl.insert(value: 7)
        avl.insert(value: 0)
        avl.insert(value: 4)
        */
        
        /*
        avl.rotateRight(node: avl.getRoot().left)
        avl.printTree()
        avl.rotateLeft(node: avl.getRoot().left)
        avl.printTree()
        */
        print("DONE")
        //print("-----------------")
        //avl.printme()
        
        //print(avl.getHeight(node: avl))
        //print(avl.height)
        
        
        //print(avl.toArray())
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

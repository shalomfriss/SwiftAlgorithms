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
        
        print("AVL------------------")
        let avl = AVLNode(value: 6)
        avl.treeRoot = avl
        avl.insert(value: 5)
        avl.insert(value: 3)
        avl.insert(value: 1)
        avl.insert(value: 7)
        avl.insert(value: 0)
        avl.insert(value: 4)
        
        avl.left?.printTree()
        avl.rotateRight(node: avl.getRoot().left)
        avl.printTree()
        avl.rotateLeft(node: avl.getRoot().left)
        avl.printTree()
        print("DONE")
        //print("-----------------")
        //avl.printme()
        
        //print(avl.getHeight(node: avl))
        //print(avl.height)
        
        
        print(avl.toArray())
        
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

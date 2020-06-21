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

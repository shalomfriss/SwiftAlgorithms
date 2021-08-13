//
//  GameScene.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 10/21/17.
//  Copyright © 2017 Shalom Friss. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var testNode:SKShapeNode!
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        
        /*
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        */
        
        // Create shape node to use during mouse interaction
        //let w = (self.size.width + self.size.height) * 0.05
        //self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        
        /*
        let container = SKShapeNode()
        
        
        self.testNode = SKShapeNode.init(rectOf: CGSize.init(width: 30, height: 100), cornerRadius: 5)
        self.testNode.lineWidth = 2.5
        container.addChild(self.testNode)
        
        var circ = SKShapeNode(circleOfRadius: 20 ) // Size of Circle
        circ.lineWidth = 2.5
        circ.position.y = 200
        container.addChild(circ)
        
        var path = CGMutablePath()
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 150))
        
        let shape = SKShapeNode()
        shape.path = path
        shape.strokeColor = UIColor.white
        shape.lineWidth = 2
        container.addChild(shape)
        
        self.addChild(container)
        
 */
        
        //testNode.position.x += 10
        
        //let heap = Heap()
        
        
        /*
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
         */
        
        /*
        var root = TreeNode(7)

        root.addValue(9)
        root.addValue(5)
        root.addValue(6)
        root.addValue(1)
        
        print("TREE-------------------------------------")
        print(root.asString)
        print("---------------------------------------")
        
        root = TreeNode(80)
        
        root.addValue(50)
        root.addValue(90)
        root.addValue(10)
        root.addValue(60)
        root.addValue(30)
        root.addValue(70)
        root.addValue(55)
        root.addValue(5)
        root.addValue(35)
        root.addValue(85)
        
        root.addValue(51)
        root.addValue(901)
        root.addValue(101)
        root.addValue(601)
        root.addValue(301)
        root.addValue(701)
        root.addValue(551)
        root.addValue(51)
        root.addValue(315)
        root.addValue(851)
        
        print(root.asString)
        
        let pr = PrintAllPermutationsWithDups(str: "aabc")
        let paren = PrintParens(num: 4)
        
        
        var dens = [25,10,5,1]
        let den = NumberOfRepresentations(dens, 100)
        
        let phils = DiningPhilosophers(num: 7)
        */
        
        
        
        /*
        let graphRoot = GraphNode(value: 10)
        let graph = Graph(root: graphRoot)
        for i in 0..<20 {
            let anode = GraphNode(value: i)
            graphRoot.addChild(aChild: anode)
        }
        
        print("-------------------------------")
        print(graph.search(aValue: 9))
        print("-------------------------------")
        */
        
        
        
        /*
        var heap = Heap<Int>(sort: <)
        heap.insert(5)
        print(heap.nodes)
        heap.insert(7)
        print(heap.nodes)
        heap.insert(3)
        print(heap.nodes)
        */
        
        /*
        let s1 = "aaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjkkkkkkkkkkllllllllllmmmmmmmmmmnnnnnnnnnnooooooooooppppppppppqqqqqqqqqqrrrrrrrrrrssssssssssttttttttttuuuuuuuuuuvvvvvvvvvvwwwwwwwwwwxxxxxxxxxxyyyyyyyyyyzzzzzzzzzzyyyyyyyyyyxxxxxxxxxxwwwwwwwwwwvvvvvvvvvvuuuuuuuuuuttttttttttssssssssssrrrrrrrrrrqqqqqqqqqqppppppppppoooooooooonnnnnnnnnnmmmmmmmmmmllllllllllkkkkkkkkkkjjjjjjjjjjiiiiiiiiiihhhhhhhhhhggggggggggffffffffffeeeeeeeeeeddddddddddccccccccccbbbbbbbbbbaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjkkkkkkkkkkllllllllllmmmmmmmmmmnnnnnnnnnnooooooooooppppppppppqqqqqqqqqqrrrrrrrrrrssssssssssttttttttttuuuuuuuuuuvvvvvvvvvvwwwwwwwwwwxxxxxxxxxxyyyyyyyyyyzzzzzzzzzzyyyyyyyyyyxxxxxxxxxxwwwwwwwwwwvvvvvvvvvvuuuuuuuuuuttttttttttssssssssssrrrrrrrrrrqqqqqqqqqqppppppppppoooooooooonnnnnnnnnnmmmmmmmmmmllllllllllkkkkkkkkkkjjjjjjjjjjiiiiiiiiiihhhhhhhhhhggggggggggffffffffffeeeeeeeeeeddddddddddccccccccccbbbbbbbbbbaaaa"
        
        let s2 = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
        
        print("Go")
        var longPal = LongestPalindrome()
        let start = DispatchTime.now()
        let palin = longPal.longestPalindrome(s1)
        let end = DispatchTime.now()
        
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
        print("Time to evaluate problem: \(timeInterval) seconds")
        print(palin)
        */
        
        //var lister = ListAllSubsets()
        //lister.list(5)
        
        
//        let subs = ListAllSubsetsOfArray()
//        subs.list([1,2,3,4,5])
//
//        let eight = EightQueensProblem()
//        eight.solve()
        
        let _ = NextSmallestElement([3,7,6,9,8,2,5,1,4])
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //self.testNode.position.x += 1
    }
    
    
    /*
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    
 */
}

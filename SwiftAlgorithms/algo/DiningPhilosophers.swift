//
//  DiningPhilosophers.swift
//  SwiftAlgorithms
//
//  Created by Shalom Friss on 6/30/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import Foundation

class Fork {
    public var index:Int
    private var lock:NSLock
    
    init(index:Int) {
        self.index = index
        self.lock = NSLock()
    }
    
    public func pickUp() {
        self.lock.lock()
    }
    
    public func putDown() {
        self.lock.unlock()
    }
}

class Philosopher {
    
    public var index:Int
    public var left:Fork?, right:Fork?
    public var op:BlockOperation?
    
    init(index:Int) {
        self.index = index
    }
    
    public func pickUp() {
        
        if let leftIndex = left?.index, let rightIndex = right?.index {
            if(leftIndex <= rightIndex) {
                left?.pickUp()
                right?.pickUp()
            } else {
                right?.pickUp()
                left?.pickUp()
            }
        }
        
    }
    
    public func putDown() {
        left?.putDown()
        right?.putDown()
    }
    
    public func eat() {
        pickUp()
        chew()
        putDown()
    }
    
    private func chew() {
        print("Philosopher \(self.index) eating with \(String(describing: left?.index)):\(String(describing: right?.index))")
    }
}

class DiningPhilosophers {
    var philosophers:[Philosopher]
    var forks:[Fork]
    
    init(num:Int) {
        self.philosophers = [Philosopher]()
        self.forks = [Fork]()
        
        for i in 0..<num {
            forks.append(Fork(index: i))
        }
        
        for i in 0..<num {
            let philosopher = Philosopher(index: i)
            philosopher.left = forks[i]
            philosopher.right = forks[(i + 1) % num]
            philosophers.append(philosopher)
        }
        
        let queue = OperationQueue()
        for x in philosophers {
            x.op = BlockOperation {
                x.eat()
            }
            queue.addOperation(x.op!)
        }
        
    }
}

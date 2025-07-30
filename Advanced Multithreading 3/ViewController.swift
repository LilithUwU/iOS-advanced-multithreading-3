//
//  ViewController.swift
//  Advanced Multithreading 3
//
//  Created by lilit on 30.07.25.
//

import UIKit


class ViewController: UIViewController {
    
    let queue = OperationQueue()
    func myOperation(name: String) {
        print("Operation \(name) started")
        for _ in 0..<1_000_000 {
            // do nothing
        }
        print("Operation \(name) finished")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var operationB: BlockOperation!
        var operationA: BlockOperation!
        
        operationB = BlockOperation {
            self.myOperation(name: "B")
        }
        
        operationA = BlockOperation {
            self.myOperation(name: "A")
        }
        
//        operationB.addDependency(operationA) 
        
        queue.addOperations([operationA, operationB], waitUntilFinished: false)
    }
}



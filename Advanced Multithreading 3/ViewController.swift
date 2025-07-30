//
//  ViewController.swift
//  Advanced Multithreading 3
//
//  Created by lilit on 30.07.25.
//


import UIKit

class ViewController: UIViewController {
    
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var operationB: BlockOperation!
        var operationA: BlockOperation!
        
        operationB = BlockOperation {
            if operationB.isCancelled {
                print("Operation \"B\" was cancelled before starting")
                return
            }
            
            print("Operation \"B\" started")
            for _ in 0..<1_000_000 {
                if operationB.isCancelled {
                    print("Operation \"B\" was cancelled during execution")
                    return
                }
            }
            print("Operation \"B\" finished")
        }
        
        operationA = BlockOperation {
            print("Operation \"A\" started")
            operationB.cancel()
            for _ in 0..<1_000_000 {
                // do something
            }
            print("Operation \"A\" finished")
        }
        
        operationB.addDependency(operationA)
        
        queue.addOperations([operationA, operationB], waitUntilFinished: false)
    }
}



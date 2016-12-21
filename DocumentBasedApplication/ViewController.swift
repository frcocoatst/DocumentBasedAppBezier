//
//  ViewController.swift
//  DocumentBasedApplication
//
//  Created by Friedrich HAEUPL on 29.11.16.
//  Copyright © 2016 Friedrich HAEUPL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var viewOutlet: NSView!
    
    var controlPoint_1: NSPoint {
        get {
            return NSPoint(x: 200, y: 200)
            //return  viewOutlet.aPoint     <-- this is not working
        }
        set {
            // here set the new value
            //viewOutlet.bPoint = newValue  <-- this is not working
            NSLog("set \(newValue)")
        }
    }
    
    var controlPoint_2: NSPoint {
        get {
            return NSPoint(x: 10, y: 20)
        }
        set {
            // here set the new value
            NSLog("set \(newValue)")
        }
    }
    
    var startPoint: NSPoint {
        get {
            return NSPoint(x: 30, y: 30)
        }
        set {
            // here set the new value
            NSLog("set \(newValue)")
        }
    }
    
    var endPoint: NSPoint {
        get {
            return NSPoint(x: 40, y: 40)
        }
        set {
            // here set the new value
            NSLog("set \(newValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}


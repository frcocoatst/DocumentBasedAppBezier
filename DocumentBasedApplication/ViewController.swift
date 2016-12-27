//
//  ViewController.swift
//  DocumentBasedApplication
//
//  Created by Friedrich HAEUPL on 29.11.16.
//  Copyright © 2016 Friedrich HAEUPL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var viewOutlet: BezierView!
    
    
    var controlPoint_1: NSPoint {
        get {
            return viewOutlet.p1
        }
        set {
            viewOutlet.p1 = newValue
        }
    }
    
    var controlPoint_2: NSPoint {
        get {
            return viewOutlet.p2
        }
        set {
            viewOutlet.p2 = newValue
        }
    }
    
    var startPoint: NSPoint {
        get {
            return viewOutlet.p3
        }
        set {
            viewOutlet.p3 = newValue
        }
    }
    
    var endPoint: NSPoint {
        get {
            return viewOutlet.p4
        }
        set {
            viewOutlet.p4 = newValue
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


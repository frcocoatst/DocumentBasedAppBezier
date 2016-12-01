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
    
/*    @IBAction func ButtonAction(_ sender: Any) {
        if (textField?.stringValue) != nil {
            print("\(textField.stringValue)")  // unwrapped
        }
        else
        {
            print("2")
        }
    }
 */
    var contents: String? {
        get {
            // return textField.stringValue
            return "Test"
        }
        set {
            if newValue != nil
            {
                //textField.stringValue = newValue!
                print("\("newValue")")
            }
            else
            {
                print("nil value")
            }
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


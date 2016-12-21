//
//  Document.swift
//  DocumentBasedApplication
//
//  Created by Friedrich HAEUPL on 29.11.16.
//  Copyright © 2016 Friedrich HAEUPL. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var contents: String = ""
    var controlPoint_1 = NSPoint()
    var controlPoint_2 = NSPoint()
    var startPoint = NSPoint()
    var endPoint  = NSPoint()

    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
        controlPoint_1 = NSPoint(x: 400, y: 400)
        controlPoint_2 = NSPoint(x: 200, y: 80)
        startPoint = NSPoint(x: 100, y: 100)
        endPoint = NSPoint(x: 500, y: 200)
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
        let viewController = windowController.contentViewController as! ViewController
        //viewController.contents = contents
        
        viewController.controlPoint_1 = controlPoint_1
        viewController.controlPoint_2 = controlPoint_2
        viewController.startPoint = startPoint
        viewController.endPoint = endPoint
        
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        // get contents
        //let contents = viewController.contents ?? ""
        
        controlPoint_1 = viewController.controlPoint_1
        controlPoint_2 = viewController.controlPoint_2
        startPoint     = viewController.startPoint
        endPoint       = viewController.endPoint
        
        
        NSLog("returned value from viewController = \n \(controlPoint_1) \(controlPoint_2) \(startPoint) \(endPoint)")
        
        /* TODO store JSON here */
 
        if let data = contents.data(using: String.Encoding.utf8) {
            return data
        } else {
            let userInfo = [
                NSLocalizedRecoverySuggestionErrorKey: "File cannot be encoded in UTF-8."
            ]
            throw NSError(
                domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {

        /* TODO read JSON here */
        
        NSLog("controlPoint_1 %f %f", controlPoint_1.x,controlPoint_1.y)
        NSLog("controlPoint_2 %f %f", controlPoint_2.x,controlPoint_2.y)
        NSLog("startPoint     %f %f", startPoint.x,startPoint.y)
        NSLog("endPoint       %f %f", endPoint.x,endPoint.y)
        
        

        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String
        {
            self.contents = contents
            NSLog("readfromdata = \(contents)")
        }
        else
        {
            let userInfo =
                [
                    NSLocalizedRecoverySuggestionErrorKey: "File is not valid UTF-8."
            ]
            throw NSError(
                domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }
}


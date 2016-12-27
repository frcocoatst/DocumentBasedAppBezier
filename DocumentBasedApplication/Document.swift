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
        // http://www.gneuron.com/?p=70
        
    }
    
    override func data(ofType typeName: String) throws -> Data {
        
        if let viewController = self.windowControllers[0].contentViewController as? ViewController{
            
            self.controlPoint_1 = viewController.controlPoint_1
            self.controlPoint_2 = viewController.controlPoint_2
            self.startPoint     = viewController.startPoint
            self.endPoint       = viewController.endPoint
            
            
            let dictionary = [
                "controlPoint_1.x": self.controlPoint_1.x,
                "controlPoint_1.y": self.controlPoint_1.y,
                "controlPoint_2.x": self.controlPoint_2.x,
                "controlPoint_2.y": self.controlPoint_2.y,
                "startPoint.x": self.startPoint.x,
                "startPoint.y": self.startPoint.y,
                "endPoint.x": self.endPoint.x,
                "endPoint.y": self.endPoint.y,
                ] as [String : Any]
            
            do {
                let Data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
                return Data
            }
            catch {
                let userInfo = [
                    NSLocalizedRecoverySuggestionErrorKey: "File cannot be encoded in UTF-8."
                ]
                throw NSError(
                    domain: "com.CocoaDocuments", code: 0, userInfo: userInfo)
            }
        }
        else {
            return Data()  // empty data
        }
        
        
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        
        do {
            let decoded = try JSONSerialization.jsonObject(with: data, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:Any] {
                // use dictFromJSON
                
                
                if let point = dictFromJSON["controlPoint_1.x"] {
                    self.controlPoint_1.x = point as! CGFloat
                }
                
                if let point = dictFromJSON["controlPoint_1.y"] {
                    self.controlPoint_1.y = point as! CGFloat
                }
                
                if let point = dictFromJSON["controlPoint_2.x"] {
                    self.controlPoint_2.x = point as! CGFloat
                }
                
                if let point = dictFromJSON["controlPoint_2.y"] {
                    self.controlPoint_2.y = point as! CGFloat
                }
                
                if let point = dictFromJSON["startPoint.x"] {
                    self.startPoint.x = point as! CGFloat
                }
                
                if let point = dictFromJSON["startPoint.y"] {
                    self.startPoint.y = point as! CGFloat
                }
                
                if let point = dictFromJSON["endPoint.x"] {
                    self.endPoint.x = point as! CGFloat
                }
                
                if let point = dictFromJSON["endPoint.y"] {
                    self.endPoint.y = point as! CGFloat
                }
            }
        } catch {
            let userInfo = [
                NSLocalizedRecoverySuggestionErrorKey: "File cannot be read."
            ]
            throw NSError(
                domain: "com.CocoaDocuments", code: 0, userInfo: userInfo)
        }
    }
    
}


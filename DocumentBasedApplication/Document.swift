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

    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
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
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        // get contents
        let contents = viewController.contents ?? ""
        
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
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String
        {
            self.contents = contents
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


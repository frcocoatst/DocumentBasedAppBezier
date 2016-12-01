//
//  WindowController.swift
//  DocumentBasedApplication
//
//  Created by Friedrich HAEUPL on 30.11.16.
//  Copyright © 2016 Friedrich HAEUPL. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {


    override func windowDidLoad() {
        super.windowDidLoad()
        if let window = window, let screen = window.screen {
            let offsetFromLeftOfScreen: CGFloat = 20
            let offsetFromTopOfScreen: CGFloat = 20
            let screenRect = screen.visibleFrame
            let newOriginY = screenRect.maxY - window.frame.height
                - offsetFromTopOfScreen
            window.setFrameOrigin(NSPoint(x: offsetFromLeftOfScreen, y: newOriginY))
        }
    }
    
    // makes windows cascading
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }

    
}

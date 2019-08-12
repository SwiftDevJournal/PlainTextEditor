//
//  Document.swift
//  PlainTextEditor
//
//  Created by mark on 8/12/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var contents = ""
    
    var viewController: ViewController? {
        return windowControllers.first?.contentViewController as? ViewController
    }
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        // Save the text view contents to disk
        if let textView = viewController?.textView {
            contents = textView.string
            return contents.data(using: .utf8) ?? Data()
        }
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let fileContents = String(data: data, encoding: .utf8) {
            contents = fileContents
        }
    }


}


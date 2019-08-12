//
//  ViewController.swift
//  PlainTextEditor
//
//  Created by mark on 8/12/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear() {
        // Fill the text view with the document's contents.
        if let document = self.view.window?.windowController?.document as? Document {
            textView.string = document.contents
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


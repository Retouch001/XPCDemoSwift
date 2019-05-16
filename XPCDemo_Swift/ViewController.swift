//
//  ViewController.swift
//  XPCDemo_Swift
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func btnClick(_ sender: Any) {
        ClientManager.default.test()
    }
    
}


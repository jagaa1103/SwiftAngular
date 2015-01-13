//
//  ViewController.swift
//  SwiftAngular
//
//  Created by Jagaa on 1/9/15.
//  Copyright (c) 2015 smartmongol. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {

    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        connectWeb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func connectWeb(){
        let bridge = BridgeAngular()
        let theWebView = bridge.initWeb(self)
        self.view.addSubview(theWebView!)
        self.webView = theWebView?
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage
        message: WKScriptMessage){
            println(message.body);
    }
}


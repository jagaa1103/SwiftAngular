//
//  BridgeToAngular.swift
//  SwiftAngular
//
//  Created by Jagaa on 1/9/15.
//  Copyright (c) 2015 smartmongol. All rights reserved.
//

import Foundation
import WebKit

class BridgeAngular{
    
    var web:WKWebView?
    
    init(){
        
    }

    
    func initWeb(ViewCtrl:UIViewController) -> (WKWebView!){
        if let messageHandler = ViewCtrl as? WKScriptMessageHandler{
            let configuration = WKWebViewConfiguration()
            configuration.userContentController.addScriptMessageHandler(messageHandler, name: "toSwift")
            web = WKWebView(frame: ViewCtrl.view.frame, configuration: configuration)
            var path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
            var url = NSURL(fileURLWithPath:path!)
            var request = NSURLRequest(URL: url!)
            web!.loadRequest(request)
            return web
        }else{
        	return nil
        }
    }
    
    func toScript(count:NSNumber){
        var userScript = WKUserScript(
            source: "fromSwift()",
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            forMainFrameOnly: true
        )
        web!.evaluateJavaScript( "fromSwift(\(count))", completionHandler: nil)
    }

}
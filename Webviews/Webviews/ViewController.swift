//
//  ViewController.swift
//  Webviews
//
//  Created by 堤隆道 on 1/5/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let url = NSURL(string: "https://www.ecowebhosting.co.uk")
        
        let request = NSURLRequest(URL: url!)

        webview.loadRequest(request)
        */
        
        let html = "<html><body><h1>My Page</h1><p>This is my page</p></body></html>"
        
        webview.loadHTMLString(html, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


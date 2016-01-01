//
//  ViewController.swift
//  downloading data
//
//  Created by 堤隆道 on 2015/12/30.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        webView.loadRequest(NSURLRequest(URL: url))
        
        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
//            
//            if let urlContent = data {
//                
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
//                
//                dispatch_async(dispatch_get_main_queue(), {
//                    () -> Void in
//                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
//                })
//                
//                
//            } else {
//                
//            }
//            
//            
//        }
//        
//        task.resume()
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


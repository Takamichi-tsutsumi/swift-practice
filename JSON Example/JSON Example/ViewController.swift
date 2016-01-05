//
//  ViewController.swift
//  JSON Example
//
//  Created by 堤隆道 on 1/5/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:NSURL = NSURL(string: "https://freegeoip.net/json/")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if error == nil {
                
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                        
                        print(jsonResult["city"])
                        
                    } catch {
                        
                        print("JSON serialization failed")
                        
                    }
                    
                }
                
            } else {
                
                print(error)
                
            }
//            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


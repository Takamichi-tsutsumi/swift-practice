//
//  ViewController.swift
//  Downloading an image
//
//  Created by 堤隆道 on 1/4/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var documentsDirectory:String?
        
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            
            documentsDirectory = paths[0] as? String
            
            let savePath = documentsDirectory! + "/chopin.jpg"
            
            self.imageView.image = UIImage(named: savePath)
            
        }
        
        
        /*
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Chopin%2C_by_Wodzinska.JPG/800px-Chopin%2C_by_Wodzinska.JPG")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                var documentsDirectory:String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as? String
                    
                    let savePath = documentsDirectory! + "/chopin.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.imageView.image = UIImage(named: savePath)
                        
                 
                    })           
                    
                }
                
         
               
            }
            
        }
        
        task.resume()
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


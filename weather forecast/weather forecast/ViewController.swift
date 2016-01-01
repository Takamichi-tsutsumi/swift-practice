//
//  ViewController.swift
//  weather forecast
//
//  Created by 堤隆道 on 2015/12/30.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var country: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func search(sender: AnyObject) {
        
        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + country.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
                (data, response, error) -> Void in
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if websiteArray.count > 0 {
                        
                        let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
                        
                        if weatherArray.count > 0 {
                            
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                            print(weatherSummary.dynamicType)
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                
                                self.resultLabel.text = weatherSummary
                                
                            })
                            
                        }
                        
                    }
                    
                    
                } else {
                    
                }
            }
            
            task.resume()
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.weather-forecast.com/locations/Paris/forecasts/latest")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data, response, error) -> Void in
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if websiteArray!.count > 0 {
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    
                    if weatherArray.count > 0 {
                        
                        print(weatherArray[0])
                        
                    }
                    
                }
                
                
            } else {
                
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        country.resignFirstResponder()
        return true
        
    }


}


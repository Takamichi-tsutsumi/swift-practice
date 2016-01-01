//
//  ViewController.swift
//  jsonapp
//
//  Created by 堤隆道 on 2015/11/12.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var prefLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    
    @IBAction func tapReturn() {
    }
    
    @IBAction func tapSearch() {
        guard let ziptext = zipTextField.text else {
            return
        }
        
        let urlStr = "http://api.zipaddress.net/?zipcode=\(ziptext)"
        print(urlStr)
        
        if let url = NSURL(string: urlStr) {
            let urlSession = NSURLSession.sharedSession()
            let task = urlSession.dataTaskWithURL(url, completionHandler: self.onGetAddress)
            task.resume()
        }
    }
    
    func onGetAddress(data: NSData?, res: NSURLResponse?, error: NSError?) {
        do {
            let jsonDic = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers ) as! NSDictionary
            print(jsonDic)
            if let code = jsonDic["200"] as? Int {
                if code != 200 {
                    if let errmsg = jsonDic["message"] as? String {
                        print(errmsg)
                    }
                }
            }
            if let data = jsonDic["data"] as? NSDictionary {
                if let pref = data["pref"] as? String {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.prefLabel.text = pref
                    }
                    print("県名は\(pref)です")
                }
                if let address = data["address"] as? String {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.addressLabel.text = address
                    }
                    print ("住所は\(address)です")
                }
            }
        } catch {
            dispatch_async(dispatch_get_main_queue()) {
                self.addressLabel.text = "エラーです"
            }
            print("Error occured")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


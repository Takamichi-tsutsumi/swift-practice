 //
//  ViewController.swift
//  hello
//
//  Created by 堤隆道 on 2015/11/11.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var atsWebView: UIWebView!
    @IBOutlet weak var myImgView: UIImageView!
    
    @IBAction func tapBtn() {
        let stringURL = NSURL(string: "http://media.tech-salon.com/")
        if let url = NSURL!(stringURL) {
            let urlreq = NSURLRequest(URL: url)
            myWebView.loadRequest(urlreq)
        }
        
        
        
//        if let url = NSURL(string: "http://media.tech-salon.com/") {
//            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
//            vc.delegate = self
//            //SFSafariViewController(URL: url, : true)
//            presentViewController(vc, animated: true, completion: nil)
//        }
    }
    
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        print("close")
    }
    
    @IBAction func tapAtsButton() {
        let techURL = NSURL(string: "http://media.tech-salon.com/")
        if let url = NSURL!(techURL) {
            let urlreq = NSURLRequest(URL: url)
            atsWebView.loadRequest(urlreq)
        }
    }
    
    @IBAction func getText() {
        if let url = NSURL(string: "http://media.tech-salon.com/") {
            let urlSession = NSURLSession.sharedSession()
            let task = urlSession.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if let nsstr = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                    let str = String(nsstr)
                    print("文字列=[\(str)]")
                }
            })
            task.resume()
        }
        
    }
    
    @IBAction func getTextFunc() {
        if let techurl = NSURL(string: "http://media.tech-salon.com/") {
            let urlSession = NSURLSession.sharedSession()
            let task = urlSession.dataTaskWithURL(techurl, completionHandler: onFinish)
            task.resume()
        }
    }
    
    func onFinish(data: NSData?, res: NSURLResponse?, error: NSError?){
        if let nsstr = NSString(data: data!, encoding: NSUTF8StringEncoding) {
            let str = String(nsstr)
            print(str)
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
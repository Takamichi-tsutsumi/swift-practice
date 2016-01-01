//
//  FirstViewController.swift
//  unitConvert
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // Object which can access AppDelegate
    let ap = UIApplication.sharedApplication().delegate as! AppDelegate
    // Called when user accesses this view
    
    override func viewWillAppear(animated: Bool) {
        // Show shared value in text field.
        dataTextField.text = String(ap.cmValue)
    }
    
    @IBAction func tapInput() {
        dataTextField.resignFirstResponder()
        if let text = dataTextField.text {
            if let cmValue = Double(text) {
                ap.cmValue = cmValue
            }
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


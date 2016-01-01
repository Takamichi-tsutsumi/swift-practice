//
//  SecondViewController.swift
//  unitConvert
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    // Object accesses AppDelegate
    let ap = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewWillAppear(animated: Bool) {
        let inchValue = ap.cmValue * 0.3937
        dataTextField.text = String(inchValue)
    }
    
    @IBAction func tapInput() {
        dataTextField.resignFirstResponder()
        if let text = dataTextField.text {
            if let inchValue = Double(text) {
                ap.cmValue = inchValue / 0.3937
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
//
//  ViewController.swift
//  hello world
//
//  Created by 堤隆道 on 2015/12/28.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        
        print("Button tapped")
        
        label.text = textField.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello world")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


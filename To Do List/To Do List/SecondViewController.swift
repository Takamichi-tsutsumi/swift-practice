//
//  SecondViewController.swift
//  To Do List
//
//  Created by 堤隆道 on 2015/12/29.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var commentField: UILabel!
    
    @IBAction func add(sender: AnyObject) {
        
        toDoList.append(text.text!)
        
        text.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }

}


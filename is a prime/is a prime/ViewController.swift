//
//  ViewController.swift
//  is a prime
//
//  Created by 堤隆道 on 2015/12/29.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
   
    @IBAction func primeBtn(sender: AnyObject) {
        
        if let num = Int(numberField.text!) {
            
            resultLabel.text = isPrime(num) ? "Prime number." : "Not prime number."
        } else {
            resultLabel.text = "Please enter numbers."
        }
    }
    
    func isPrime(num:Int) -> Bool {
        
        var _prime = true
        
        if num == 0 || num == 1 {
            _prime = false
        }
        
        for var i = 2; i < num; i++ {
            
            if num % i == 0 {
                _prime = false
                break
            }
            
        }
        
        return _prime
        
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


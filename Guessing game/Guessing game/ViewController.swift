//
//  ViewController.swift
//  Guessing game
//
//  Created by 堤隆道 on 2015/12/28.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    func checkNum(current_num:Int) -> String {
        let nextNum = nextNumber()
        numberLabel.text = String(nextNum)
        if current_num < nextNum {
            return "Big"
        } else if current_num == nextNum {
            return "Equal"
        } else {
            return "Small"
        }
    }
    
    @IBAction func biggerBtn(sender: AnyObject) {
        let ans = checkNum(Int(numberLabel.text!)!)
        if ans == "Big" {
            commentLabel.text = "You win!!"
        } else {
            commentLabel.text = "Lose..."
        }
    }
    
    @IBAction func smallerBtn(sender: AnyObject) {
        let ans = checkNum(Int(numberLabel.text!)!)
        if ans == "Small" {
            commentLabel.text = "You win!!"
        } else {
            commentLabel.text = "Lose..."
        }
    }
    
    @IBAction func sameBtn(sender: AnyObject) {
        let ans = checkNum(Int(numberLabel.text!)!)
        if ans == "Equal" {
            commentLabel.text = "You win!!"
        } else {
            commentLabel.text = "Lose..."
        }
    }
    
    func nextNumber() -> Int {
        return Int(arc4random_uniform(10))
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


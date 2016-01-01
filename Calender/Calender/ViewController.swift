//
//  ViewController.swift
//  Calender
//
//  Created by 堤隆道 on 2015/10/14.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var aCalender: MyCalender = MyCalender()

    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBAction func prevMonth(sender: AnyObject) {
    }
    @IBAction func nextMonth(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calLabel.text = aCalender.calendarString()
        yearMonthLabel.text = "\(aCalendar.year)年\(aCalendar.month)月"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


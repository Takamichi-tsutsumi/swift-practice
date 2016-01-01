//
//  ThirdViewController.swift
//  unitConvert
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    let ap = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewWillAppear(animated: Bool) {
        let sunValue = ap.cmValue * 0.33
        dataTextField.text = String(sunValue)
    }
    
    @IBAction func tapInput() {
        dataTextField.resignFirstResponder()
        if let text = dataTextField.text {
            if let sunValue = Double(text) {
                ap.cmValue = sunValue / 0.33
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

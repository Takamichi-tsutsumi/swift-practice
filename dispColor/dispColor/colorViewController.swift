//
//  colorViewController.swift
//  dispColor
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class colorViewController: UIViewController {
    
    // color values
    var colorR = 0
    var colorG = 0
    var colorB = 0
    
    override func viewWillAppear(animated: Bool) {
        let backColor = UIColor(
            red: CGFloat(colorR) / 256.0,
            green: CGFloat(colorG) / 256.0,
            blue: CGFloat(colorB) / 256.0,
            alpha: 1.0)
        view.backgroundColor = backColor
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

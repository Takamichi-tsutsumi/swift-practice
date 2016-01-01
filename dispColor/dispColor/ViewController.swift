//
//  ViewController.swift
//  dispColor
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!
    
    // random color
    let randomSource = GKARC4RandomSource()
    var colorR = 0
    var colorG = 0
    var colorB = 0
    
    override func viewWillAppear(animated: Bool) {
        colorR = randomSource.nextIntWithUpperBound(256)
        colorG = randomSource.nextIntWithUpperBound(256)
        colorB = randomSource.nextIntWithUpperBound(256)
        
        colorLabel.text = "RGB = (\(colorR), \(colorG), \(colorB))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 次のcontrollerに値を受け渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextvc = segue.destinationViewController as! colorViewController
        nextvc.colorR = colorR
        nextvc.colorG = colorG
        nextvc.colorB = colorB
    }
    
    @IBAction func returnTop(segue: UIStoryboardSegue) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


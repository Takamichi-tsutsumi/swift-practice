//
//  ViewController.swift
//  animations
//
//  Created by 堤隆道 on 2015/12/30.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var current_frame = 1
    
    var timer = NSTimer()
    var isAnimating = true
    
    func next_frame(current: Int) -> Int {
        if current == 4 {
            return 1
        } else {
            return current + 1
        }
    }

    @IBOutlet weak var animalImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        print(timer.valid)
        
        if timer.valid {
            timer.invalidate()
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        
    }
    
    func doAnimation() {
        current_frame = next_frame(current_frame)
        animalImage.image = UIImage(named: "bird\(current_frame).png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func viewDidLayoutSubviews() {
        
//        animalImage.center = CGPointMake(animalImage.center.x - 400, animalImage.center.y)
//        animalImage.alpha = 0
        animalImage.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: {() -> Void in
            
            self.animalImage.frame = CGRectMake(100, 20, 100, 100)
            
//            self.animalImage.center = CGPointMake(self.animalImage.center.x + 400, self.animalImage.center.y)
//            self.animalImage.alpha = 1
            
        })
    }
*/


}


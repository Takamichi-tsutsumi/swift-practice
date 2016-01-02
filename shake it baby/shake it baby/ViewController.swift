//
//  ViewController.swift
//  shake it baby
//
//  Created by 堤隆道 on 1/3/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var musics = ["djralph", "audacity", "fish_eagle", "turkey", "djraprap"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            changeMusic()
            
        }
        
    }
    
    func changeMusic() {
        let songNumber = Int(arc4random_uniform(UInt32(musics.count)))
        let audioPath = NSBundle.mainBundle().pathForResource(musics[songNumber], ofType: "mp3")
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
            
            player.play()
        } catch {
            
            print("Something went wrong. look at your error message.")
            
        }
        
    }


}


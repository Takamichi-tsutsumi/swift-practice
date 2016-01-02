//
//  ViewController.swift
//  working with audio
//
//  Created by 堤隆道 on 1/2/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var durationSlider: UISlider!
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updatePlayingTime", userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        player.currentTime = 0
        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = slider.value
        
    }
    
    @IBAction func adjustDuration(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(durationSlider.value)
        
    }
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var timer:NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("chopin", ofType: "mp3")!
        var totalTime:NSTimeInterval = NSTimeInterval()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            totalTime = player.duration
            
        } catch {
            
            print("error happened")
            
        }
        
        durationSlider.minimumValue = 0
        durationSlider.maximumValue = Float(totalTime)
        durationSlider.value = 0
        durationSlider.continuous = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updatePlayingTime() {
        
        durationSlider.value = Float(player.currentTime)
        
    }

}


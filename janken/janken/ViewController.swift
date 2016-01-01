//
//  ViewController.swift
//  janken
//
//  Created by 堤隆道 on 2015/11/12.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    let randomSource = arc4random_uniform(2)
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let angle:CGFloat = CGFloat((180.0 * M_PI) / 180.0)
        computerImageView.transform = CGAffineTransformMakeRotation(angle)
    }

    @IBAction func tapStart() {
        computerImageView.image = UIImage(named: "rock.png")
        playerImageView.image = UIImage(named: "rock.png")
        messageLabel.text = "じゃんけん！"
    }
    
    @IBAction func tapRock() {
        messageLabel.text = "ぽんっ！！"
        let computer: Int = doComputer()
        playerImageView.image = UIImage(named: "rock.png")
        judge(computer, player: 0)
    }
    
    @IBAction func tapSisors() {
        messageLabel.text = "ぽんっ！！"
        let computer: Int = doComputer()
        playerImageView.image = UIImage(named: "sisors.png")
        judge(computer, player: 1)
    }
    
    @IBAction func tapPaper() {
        messageLabel.text = "ぽんっ！！"
        let computer: Int = doComputer()    
        playerImageView.image = UIImage(named: "paper.png")
        judge(computer, player: 2)
    }
    
    func doComputer() -> Int {
        let computer: Int = Int(arc4random_uniform(2))
        switch computer {
        case 0:
            computerImageView.image = UIImage(named: "rock.png")
        case 1:
            computerImageView.image = UIImage(named: "sisors.png")
        case 2:
            computerImageView.image = UIImage(named: "paper.png")
        default :
            break
        }
        return computer
    }
    
    func judge(computer: Int, player: Int) {
        switch computer - player {
        case 1, -2:
            messageLabel.text = "あなたの勝ち!!"
        case 2, -1:
            messageLabel.text = "あなたの負け..."
        case 0:
            messageLabel.text = "あいこで"
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
//
//  ViewController.swift
//  noughts and crosses
//
//  Created by 堤隆道 on 2015/12/30.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = noughts, 2 = crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var buttonZero = UIButton()
    
    let winningCombinations = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    var gameActive = true

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        resultField.hidden = true
        playAgainBtn.hidden = true
        
        resultField.center = CGPointMake(resultField.center.x - 500, resultField.center.y)
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 500, playAgainBtn.center.y)
        
        var buttonToClear: UIButton
        
        buttonZero.setImage(nil, forState: .Normal)
        
        for var i = 1; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    @IBOutlet weak var resultField: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive) {
            
            gameState[sender.tag] = activePlayer
            
            if  activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 &&
                    gameState[combination[0]] == gameState[combination[1]] &&
                    gameState[combination[1]] == gameState[combination[2]]) {
                        
                        if gameState[combination[0]] == 1 {
                            
                            resultField.text = "Noughts has won!"
                            
                        } else {
                            
                            resultField.text = "Crosses has won!"
                            
                        }
                        
                        gameActive = false
                        
                        gameOver()
                }
                
            }
            
            if gameActive {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if !gameActive {
                    
                    resultField.text = "It's a draw!"
                    
                    gameOver()
                    
                }
                
            }
            
        }
        
        
    }
    
    
    func gameOver() {
        
        resultField.hidden = false
        playAgainBtn.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.resultField.center = CGPointMake(self.resultField.center.x + 500, self.resultField.center.y)
            self.playAgainBtn.center = CGPointMake(self.playAgainBtn.center.x + 500, self.playAgainBtn.center.y)
            
        })
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(view.viewWithTag(0))
        
        resultField.hidden = true
        playAgainBtn.hidden = true
        
        resultField.center = CGPointMake(resultField.center.x - 500, resultField.center.y)
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 500, playAgainBtn.center.y)
        buttonZero = view.viewWithTag(0) as! UIButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


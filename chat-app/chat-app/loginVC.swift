//
//  ViewController.swift
//  chat-app
//
//  Created by 堤隆道 on 2015/11/17.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var useremailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        welcomeLbl.center = CGPointMake(theWidth/2, 130)
        useremailTxt.frame = CGRectMake(16, 200, theWidth-32, 30)
        passwordTxt.frame = CGRectMake(16, 240, theWidth-32, 30)
        loginBtn.center = CGPointMake(theWidth/2, 330)
        signupBtn.center = CGPointMake(theWidth/2, theHeight-30)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }

    
    @IBAction func loginBtn_click(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(useremailTxt.text!, password: passwordTxt.text!) {
            (user:PFUser?, logInError:NSError?) -> Void in
            if logInError == nil {
                print("log in")
                
                var installation:PFInstallation = PFInstallation.currentInstallation()
                installation["user"] = PFUser.currentUser()
                installation.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in })
                
                self.performSegueWithIdentifier("goToUsersVC", sender: self)
                
            } else {
                print(" cant log in")
            }
        }
    }

}

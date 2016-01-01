//
//  signupVC.swift
//  chat-app
//
//  Created by 堤隆道 on 2015/11/17.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class signupVC: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var addImgBtn: UIButton!
    @IBOutlet weak var useremailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var profilenameTxt: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let theWidth = view.frame.size.width
        _ = view.frame.size.height
        
        profileImg.center = CGPointMake(theWidth/2, 140)
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        
        addImgBtn.center = CGPointMake(self.profileImg.frame.maxX+50, 140)
        useremailTxt.frame = CGRectMake(16, 230, theWidth-32, 30)
        passwordTxt.frame = CGRectMake(16, 270, theWidth-32, 30)
        profilenameTxt.frame = CGRectMake(16, 310, theWidth-32, 30)
        signupBtn.center = CGPointMake(theWidth/2, 380)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addImgBtn_click(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!,
      didFinishPickingImage image: UIImage!,
      editingInfo: [NSObject : AnyObject]!) {
        
        profileImg.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        useremailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        profilenameTxt.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>,withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        if (UIScreen.mainScreen().bounds.height == 568) {
            if (textField == self.profilenameTxt) {
                UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                    self.view.center = CGPointMake(theWidth/2, (theHeight/2)-40)
                    }, completion: {
                        (finished:Bool) in
                })
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        if (UIScreen.mainScreen().bounds.height == 568) {
            if (textField == self.profilenameTxt) {
                UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
                    self.view.center = CGPointMake(theWidth/2, (theHeight/2))
                    }, completion: {
                        (finished:Bool) in
                })
            }
        }
    }
    
    @IBAction func signupBtn_click(sender: AnyObject) {
        
        let user = PFUser()
        user.username = useremailTxt.text
        user.password = passwordTxt.text
        user.email = useremailTxt.text
        user["profileName"] = profilenameTxt.text
        
        let imageData = UIImagePNGRepresentation(self.profileImg.image!)
        let imageFile = PFFile(name: "profilePhoto.png", data: imageData!)
        user["photo"] = imageFile
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, signUpError:NSError?) -> Void in
            
            if signUpError == nil {
                print("singup")
                let installation:PFInstallation = PFInstallation.currentInstallation()
                installation["user"] = PFUser.currentUser()
                installation.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in })
                
                self.performSegueWithIdentifier("goToUsersVCFromSignUp", sender: self)
            } else {
                print("cant sing up")
            }
        }
        
    }
    
}

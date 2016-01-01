//
//  usersVC.swift
//  chat-app
//
//  Created by 堤隆道 on 2015/11/19.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

var userName = ""

class usersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var resultsTable: UITableView!
    
    var resultsUsernameArray = [String]()
    var resultsProfileNameArray = [String]()
    var resultsImageFiles = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = view.frame.size.width
        let theHeight = view.frame.size.height
        
        resultsTable.frame = CGRectMake(0, 0, theHeight, theHeight-64)
        
        userName = PFUser.currentUser()!.username!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let predicate = NSPredicate(format: "username !='"+userName+"'")
        let query = PFQuery(className: "_User", predicate: predicate)
        let objects = try! query.findObjects()
        
        for object in objects {
            let us:PFUser = object as! PFUser
            self.resultsUsernameArray.append(us.username!)
            self.resultsProfileNameArray.append(object["profileName"] as! String)
            self.resultsImageFiles.append(object["photo"] as! PFFile)
            
            self.resultsTable.reloadData()
        }
        
   }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! resultsCell
        
        otherName = cell.usernameLbl.text!
        otherProfileName = cell.profileNameLbl.text!
        self.performSegueWithIdentifier("goToConversationVC", sender: self)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsUsernameArray.count
    }
    
    func tableView(tableView: UITableView, heightForAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:resultsCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! resultsCell
        
        cell.usernameLbl.text = self.resultsUsernameArray[indexPath.row]
        cell.profileNameLbl.text = self.resultsProfileNameArray[indexPath.row]
        
        resultsImageFiles[indexPath.row].getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            
            if error == nil {
                let image = UIImage(data: imageData!)
                cell.profileImg.image = image
            }
        }
        
        return cell
    }
    
    @IBAction func logoutBtn_click(sender: AnyObject) {
        
        PFUser.logOut()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }


}

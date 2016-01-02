//
//  TableViewController.swift
//  Memorable Places
//
//  Created by 堤隆道 on 1/2/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import CoreLocation

var placeList = [String]()
var activePlace = -1

class TableViewController: UITableViewController {

    @IBOutlet var placesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if NSUserDefaults.standardUserDefaults().objectForKey("placeList") != nil {
            
            placeList = NSUserDefaults.standardUserDefaults().objectForKey("placeList") as! [String]
            
        }

        print(placeList)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print("view did appear")
        placesTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return placeList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        
            cell.textLabel?.text = placeList[indexPath.row]
        


        return cell
    }
    

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            placeList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(placeList, forKey: "placeList")
            
            placesTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newPlace" {
            
            activePlace = -1
            
        }
    }
}

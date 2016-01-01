//
//  ViewController.swift
//  core dat ademo
//
//  Created by 堤隆道 on 2015/12/29.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
//        
//        newUser.setValue("Tommy", forKey: "username")
//        newUser.setValue("tomtom", forKey: "password")
//        
//        do {
//            
//            try context.save()
//            
//        } catch {
//            
//            print("There was a problem")
//            
//        }
        
        let request = NSFetchRequest(entityName: "Users")
        
//        request.predicate = NSPredicate(format: "username = %@", "Ralphi")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
//                    result.setValue("Ralphi", forKey: "username")
                    
//                    context.deleteObject(result)
                    
                    do {
                        try context.save()
                    } catch {
                        print("Something wrong")
                    }
                    
                    
                    if let username = result.valueForKey("username") as? String {
                        
                        print(username)
                        
                    }
                }
                
            }
            
        } catch {
            
            print("Something went wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


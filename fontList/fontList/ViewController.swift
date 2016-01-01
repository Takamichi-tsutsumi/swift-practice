//
//  ViewController.swift
//  fontList
//
//  Created by 堤隆道 on 2015/11/13.
//  Copyright © 2015年 堤隆道. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var fontName_array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for fontFamilyName in UIFont.familyNames() {
            for fontName in UIFont.fontNamesForFamilyName(fontFamilyName as String) {
                fontName_array.append(fontName as String)
            }
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontName_array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        let fontname = fontName_array[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: fontname, size: 18)
        cell.textLabel?.text = "ABCDEFG abcdefg 01234 あいうえお"
        
        cell.detailTextLabel?.textColor = UIColor.brownColor()
        cell.detailTextLabel?.text = fontname
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


//
//  ViewController.swift
//  my place
//
//  Created by 堤隆道 on 1/2/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager:CLLocationManager!
    
    @IBOutlet weak var latLbl: UILabel!
    
    @IBOutlet weak var lonLbl: UILabel!
    
    @IBOutlet weak var courseLbl: UILabel!
    
    @IBOutlet weak var speedLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var lat = locations[0].coordinate.latitude
        var lon = locations[0].coordinate.longitude
        
        var location = CLLocation(latitude: lat, longitude: lon)
        var address = CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            
            let placemark = placemarks![0] as CLPlacemark
            self.addressLbl.text = self.makeLocationInfo(placemark)
            
        })

        latLbl.text = "\(locations[0].coordinate.latitude)"
        lonLbl.text = "\(locations[0].coordinate.longitude)"
        speedLbl.text = "\(locations[0].speed)"
        courseLbl.text = "\(locations[0].course)"
        
        
    }
    
    func makeLocationInfo(placemark:CLPlacemark) -> String {
        
        var location:String = ""
        if placemark.locality != nil {
            location += placemark.locality!
        }
         if placemark.administrativeArea != nil {
            location += placemark.administrativeArea!
        }
         if placemark.country != nil {
            location += placemark.country!
        }
//         if placemark.locality != nil {
//            location += placemark.locality!
//        }
//         if placemark.locality != nil {
//            location += placemark.locality!
//        }
        
        return location
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


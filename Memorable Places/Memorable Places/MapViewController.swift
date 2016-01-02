//
//  MapViewController.swift
//  Memorable Places
//
//  Created by 堤隆道 on 1/2/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude:CLLocationDegrees = 35.658182
        let longitude:CLLocationDegrees = 139.702043

        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.mapView.setRegion(region, animated: true)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "addPlace:")
        
        uilpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilpgr)
        
        print("called view did load")
        print("placeList")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPlace(gestureRecognizer: UIGestureRecognizer) {
        
        print("add this place")
        
        let touchPoint = gestureRecognizer.locationInView(self.mapView)
        
        let newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        let newLocation = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        CLGeocoder().reverseGeocodeLocation(newLocation, completionHandler: {(placemarks, error) -> Void in
        
            let placemark = placemarks![0]
            
            placeList.append("\(placemark.locality!) \(placemark.country!)")
            
        })
        
        NSUserDefaults.standardUserDefaults().setObject(placeList, forKey: "placeList")
        print(placeList)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

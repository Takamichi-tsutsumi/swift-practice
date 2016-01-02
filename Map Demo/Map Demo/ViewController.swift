//
//  ViewController.swift
//  Map Demo
//
//  Created by 堤隆道 on 1/1/16.
//  Copyright © 2016 堤隆道. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        // 緯度経度
        let latitude:CLLocationDegrees = 35.658182
        let longitude:CLLocationDegrees = 139.702043
        
        // スクリーンの大きさ。緯度の差
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Shibuya"
        annotation.subtitle = "crowded place"
        
        map.addAnnotation(annotation)
       
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        print("Gesture Recognizer")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New place"
        annotation.subtitle = "This is new point"
        
        map.addAnnotation(annotation)
        
    }
        
        
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


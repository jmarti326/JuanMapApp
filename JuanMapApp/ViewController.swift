//
//  ViewController.swift
//  JuanMapApp
//
//  Created by Juan Marti on 8/23/15.
//  Copyright (c) 2015 Juan Marti. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Launch walkthrough screens
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasViewedWalkthrough = defaults.boolForKey("hasViewedWalkthrough")
        
        if hasViewedWalkthrough == false {
            if let startingViewController = storyboard?.instantiateViewControllerWithIdentifier("StartingViewController") as? StartingViewController {
                
                self.presentViewController(startingViewController, animated: true, completion: nil)
            }
        }
        startLocationServices();
        
        updateData();
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        updateData();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLocationServices(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation;
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude);
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01));
        
        self.mapView.setRegion(region, animated: true);
        
        updateData(center.latitude, longitude: center.longitude);
        
        //To save batery life.
        locationManager.stopUpdatingLocation();
    }
    
    func updateData(){
        println("Lat: \(self.mapView.centerCoordinate.latitude)");
        println("Long: \(self.mapView.centerCoordinate.longitude)");
        
        let lat = Double(round(100000*self.mapView.centerCoordinate.latitude)/100000);
        let long = Double(round(100000*self.mapView.centerCoordinate.longitude)/100000);
        
        //let lat = String(format: "%.5f", self.mapView.centerCoordinate.latitude);
        //let long = String(format: "%.5f", self.mapView.centerCoordinate.longitude);
        
        self.title = "Lat:  \(lat)"+" Long:  \(long)";
    }
    
    func updateData(latitude:Double, longitude:Double){
        println("Lat: \(self.mapView.centerCoordinate.latitude)");
        println("Long: \(self.mapView.centerCoordinate.longitude)");
        
        let lat = Double(round(100000*latitude)/100000);
        let long = Double(round(100000*longitude)/100000);
        
        //let lat = String(format: "%.5f", self.mapView.centerCoordinate.latitude);
        //let long = String(format: "%.5f", self.mapView.centerCoordinate.longitude);
        
        self.title = "Lat:  \(lat)"+" Long:  \(long)";
    }
    
    @IBAction func refreshPosition(action:AnyObject){
        startLocationServices();
    }


}


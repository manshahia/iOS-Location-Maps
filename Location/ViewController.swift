//
//  ViewController.swift
//  Location
//
//  Created by Ravi Inder Manshahia on 10/11/18.
//  Copyright © 2018 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location : CLLocation = locations[0]
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let latDelta = 0.05
        let longDelta = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        

        map.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
    }
    


}


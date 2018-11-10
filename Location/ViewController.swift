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

    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var postalCode: UILabel!
    @IBOutlet weak var subAdministrativeArea: UILabel!
    @IBOutlet weak var sublocality: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    
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
        
        self.latitude.text = String(location.coordinate.latitude)
        self.longitude.text = String(location.coordinate.longitude)
        self.course.text = String(location.course)
        self.speed.text = String(location.speed)
        self.altitude.text = String(location.altitude)

        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0]
                {
                    var sublocality = ""
                    var subAdministrativeArea = ""
                    var postalCode = ""
                    var country = ""
                    
                    if placemark.subLocality != nil{
                        sublocality = placemark.subLocality!
                    }
                    
                    if placemark.subAdministrativeArea != nil{
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    if placemark.postalCode != nil{
                        postalCode = placemark.postalCode!
                    }
                    if placemark.country != nil{
                        country = placemark.country!
                    }
                    
                    self.sublocality.text = sublocality
                    self.subAdministrativeArea.text = subAdministrativeArea
                    self.postalCode.text = postalCode
                    self.country.text = country
                    print(placemark)
                }
            }
            else {
                print("Error :: ", error!)
            }
        }
    }
    


}


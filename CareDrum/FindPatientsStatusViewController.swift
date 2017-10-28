//
//  FindPatientsStatusViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-21.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FindPatientsStatusViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    @IBOutlet weak var targetStatusImage: UIImageView!
    @IBOutlet weak var targetOnMap: MKMapView!
    @IBOutlet weak var targetMainAddress: UITextField!
    @IBOutlet weak var targetAllowedDistance: UITextField!
    @IBOutlet weak var targetDistanceFromMainAddress: UITextField!
    @IBOutlet weak var geoWarningMessage: UITextField!
    
    let manager = CLLocationManager()
    
    let patientsomeaddress:String = "280 Albert, Ottawa, Ontario, K1P 5G8";
    
    let geocoder = CLGeocoder()
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        targetOnMap.setRegion(region, animated: true)
        self.targetOnMap.showsUserLocation = true
        
        location.distance(from:)
        targetDistanceFromMainAddress.text="100 meters from Home"
        
        var patientmainaddress: CLLocation?
        targetMainAddress.text = patientsomeaddress
        geoWarningMessage.text = "Status: GREEN or RED"
        geocoder.geocodeAddressString(patientsomeaddress) { (placemarks, error) in
            if let placemarks = placemarks, placemarks.count > 0 {
                patientmainaddress = placemarks.first?.location
            }
            if let patientmainaddress = patientmainaddress {
                let coordinate = patientmainaddress.coordinate
                self.targetDistanceFromMainAddress.text = "\(coordinate.latitude), \(coordinate.longitude)"
                location.distance(from: patientmainaddress)
                print(location.distance(from: patientmainaddress))
                self.targetDistanceFromMainAddress.text = "\(location.distance(from: patientmainaddress) / 1000)"
                
                let targetAllowedDistanceInt: Double? = Double(self.targetAllowedDistance.text!)
                let targetDistanceFromMainAddressInt = (location.distance(from: patientmainaddress) / 1000)
                
                print("Allowed Distance: \(targetAllowedDistanceInt), Current Distance as Integer: \(targetDistanceFromMainAddressInt), Current Distance as text \(self.targetDistanceFromMainAddress.text)")
                
                // Next If statement changes status logo based on distance
                if targetAllowedDistanceInt != nil {
                if targetDistanceFromMainAddressInt > targetAllowedDistanceInt! {
                    self.targetStatusImage.image = UIImage(named: "SaidWhatLogo") }
                    else {
                        self.targetStatusImage.image = UIImage(named: "StatusOkLight")
                    }
                }
                
            } else {
                self.targetDistanceFromMainAddress.text = "No Matching Location Found"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.targetAllowedDistance.delegate = self
        targetStatusImage.image = UIImage(named: "SaidWhatLogo")
        
        // geoWarningMessage.text = "Status: GREEN or RED"
        targetAllowedDistance.text = "2"
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getTargetStatus(_ sender: Any) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

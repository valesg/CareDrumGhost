//
//  ViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-09.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    @IBOutlet weak var registerAll: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var addressPrimary: UITextField!
    @IBOutlet weak var licenseNumber: UITextField!
    
    let publicDB = CKContainer.default().publicCloudDatabase
    let privateDB = CKContainer.default().privateCloudDatabase
    let instuff = "Am Caregiver"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
       
    }

  
    @IBAction func registerPatientAndCaregiver(_ sender: Any) {
        let theRegistrant = CKRecord(recordType: "Caregiver")
        print("FIRST: Show initial values of THE REGISTRANT: \(theRegistrant)")
        theRegistrant.setValue(firstName.text, forKey: "FirstName")
        theRegistrant.setValue(lastName.text, forKey: "LastName")
        theRegistrant.setValue(licenseNumber.text, forKey: "CaregiverID")
        print("SECOND: Show assigned values of THE REGISTRANT: \(theRegistrant)")
        
        publicDB.save(theRegistrant) { (record, _) in
        //    print("Error is: \(error)")
                guard record != nil else { print("The record is: \(String(describing: record))")
                return}
                print("Print recond saved")
            }
            
        }
    
     
    
  @IBAction func clearValues(_ sender: Any) {
        print("Show values, first name is: \(firstName)")
    }
    
  @IBAction func addServiceRequest(_ sender: Any) {
        print("In Add Service Request")
    }
    
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


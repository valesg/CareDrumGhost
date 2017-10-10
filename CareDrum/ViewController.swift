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
    
    var vFirstName: String
    
    let database = CKContainer.default().publicCloudDatabase
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
       
    }

  
    @IBAction func registerPatientAndCaregiver(_ sender: Any) {
        let theRegistrant = CKRecord(recordType: "Caregiver")
        theRegistrant.setValue("Guy 01", forKey: "Prenom")
        database.save(theRegistrant) { (record, _) in
            guard record != nil else {return}
            print("Print registration")
        }
        
    }
    
    
    @IBAction func addServiceRequest(_ sender: Any) {
        print("In Add Service Request")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


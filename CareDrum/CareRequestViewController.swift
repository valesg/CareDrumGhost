//
//  CareRequestViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
import CloudKit

class CareRequestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var requestorID: UILabel!
    @IBOutlet weak var careRequestorID: UITextField!
    @IBOutlet weak var careRequestPatientID: UILabel!
    @IBOutlet weak var careRequestPatientIDValue: UITextField!
    @IBOutlet weak var careRequestPatientAddress: UITextField!
    @IBOutlet weak var careRequestServiceTime: UIDatePicker!
    @IBOutlet weak var requestedServicePicker: UIPickerView!
    var chosenCare: String = ""
    
    let careservices = ["Blood Work", "Companionship", "Dressing", "Full-Day", "Half-Day", "Homemaker", "Lab Test", "Nutrition", "Pharmaceutical", "Physical Therapy", "Speech Therapy", "Toiletting", "Transportation", "Vaccination", "Other"]
    
    let publicDB = CKContainer.default().publicCloudDatabase
    let privateDB = CKContainer.default().privateCloudDatabase
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return careservices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return careservices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenCare = careservices[row]
        print("Chosen Care is: \(chosenCare)")
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepping so that clicking on screen will hide keyboard
        self.careRequestorID.delegate = self
        self.careRequestPatientIDValue.delegate = self
        self.careRequestPatientAddress.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func storeCareRequest(_ sender: Any) {
        
        //Store LastKnownLocation.  Should be it's own function
        let theCareRequest = CKRecord(recordType: "CareRequest")
        print("FIRST: Show initial values of CAREREQUEST: \(theCareRequest)")
        theCareRequest.setValue(careRequestorID.text, forKey: "RequestorID")
        theCareRequest.setValue(careRequestPatientIDValue.text, forKey: "PatientID")
        print("SECOND: Show assigned values of CAREREQUEST: \(theCareRequest)")
        theCareRequest.setValue(chosenCare, forKey: "ServiceName")
        theCareRequest.setValue(careRequestServiceTime.date, forKey: "ServiceTime")
        // print("THIRD: Show assigned values of CAREREQUEST: \(theCareRequest)")
        
        self.publicDB.save(theCareRequest) { (record, _) in
            //    print("Error is: \(error)")
            guard record != nil else { print("The record is: \(String(describing: record))")
                return}
            print("Print CAREREQUEST recond saved")
        }
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

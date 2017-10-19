//
//  CareRequestViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class CareRequestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var requestedServicePicker: UIPickerView!
    var chosenCare: String = ""
    
    let careservices = ["Blood Work", "Companion", "Dressing", "Full-Day", "Half-Day", "Homemaker", "Nutrition", "Physical Therapy", "Speech Therapy", "Toiletting", "Vaccination", "Other"]
    
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

        // Do any additional setup after loading the view.
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

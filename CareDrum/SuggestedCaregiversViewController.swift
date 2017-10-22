//
//  SuggestedCaregiversViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class SuggestedCaregiversViewController: UIViewController {

    @IBOutlet weak var addedCaregiverOne: UITextField!
    @IBOutlet weak var addedCaregiverTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addedCaregiverOne.isHidden = true
        addedCaregiverTwo.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) }
        ))
    }
    
    @IBAction func selectDispatchCaregiver(_ sender: Any) {
      // calling createAlert function currently gives an error. so commenting it
        // createAlert(title: "Care Request", message: "Find and Dispatch")
    }
    
    @IBAction func addToSuggestedList(_ sender: Any) {
        addedCaregiverOne.isHidden = false
        addedCaregiverOne.isHighlighted = true
        addedCaregiverTwo.isHidden = false
        addedCaregiverTwo.isHighlighted = true
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

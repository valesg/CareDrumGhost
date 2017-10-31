//
//  SignViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class SignViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nonLicencedLabel: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var addressPrimary: UITextField!
    @IBOutlet weak var cprTraining: UISwitch!
    @IBOutlet weak var handlingTraining: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepping so that clicking on screen will hide keyboard
        self.addressPrimary.delegate = self
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.addressPrimary.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        nonLicencedLabel.text = "DYNAMIC: Sign Up for Non-Licensed Caregivers"

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

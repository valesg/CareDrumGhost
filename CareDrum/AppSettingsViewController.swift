//
//  AppSettingsViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class AppSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resetSettings(_ sender: Any) {
        performSegue(withIdentifier: "settingstowelcome", sender: self)
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

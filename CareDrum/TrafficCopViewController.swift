//
//  TrafficCopViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
var onduty = "yes"

class TrafficCopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recentCareRequestsTable: UITableView!
    
    let recentcarerequests = ["Requestor 1, S1 on Date X, PENDING", "Requestor 1, S8 on Date X, PENDING", "Requestor 1, S7 on Date X, DONE", "Requestor 2, S2 on Date X, DONE", "Requestor 3, S3 on Date X, DONE", "Requestor 4, S4 on Date X, CANCELLED", "Requestor 4, S7 on Date X, DONE", "Requestor 5, S8 on Date X, DONE"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(recentcarerequests.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "recentcare")
        cell.textLabel?.text = recentcarerequests[indexPath.row]
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        // Do any additional setup after loading the view.
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func careRequest(_ sender: Any) {
        performSegue(withIdentifier: "coptoreq", sender: self)
    }
    
    @IBAction func signUp(_ sender: Any) {
        
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

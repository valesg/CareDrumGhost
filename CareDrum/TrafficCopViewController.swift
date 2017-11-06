//
//  TrafficCopViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
import CloudKit

var onduty = "yes"

class TrafficCopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recentCareRequestsTable: UITableView!
    
    var myRecentCareRequests = [CKRecord]()
    
    let recentcarerequests = ["Requestor1, S1 on Date X, PENDING", "Requestor1, S8 on Date X, PENDING", "Requestor1, S7 on Date X, DONE", "Requestor2, S2 on Date X, DONE", "Requestor3, S3 on Date X, DONE", "Requestor4, S4 on Date X, CANCELLED", "Requestor4, S7 on Date X, DONE", "Requestor5, S8 on Date X, DONE"]
    
    let publicDB = CKContainer.default().publicCloudDatabase
    let privateDB = CKContainer.default().privateCloudDatabase
    
    
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
        queryRecentCareRequests(personID: "PID-112")
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func careRequest(_ sender: Any) {
        performSegue(withIdentifier: "coptoreq", sender: self)
    }
    
    @IBAction func signUp(_ sender: Any) {
        
    }
    
    func queryRecentCareRequests(personID: String) -> Void {
        let myPredicate = NSPredicate(format: "PatientID == %@", "PID-100")
        let mySort = NSSortDescriptor(key: "PatientID", ascending: true)
        let myQuery = CKQuery(recordType: "CareRequest", predicate: myPredicate)
        myQuery.sortDescriptors = [mySort]
        
        let myQueryOp = CKQueryOperation(query: myQuery)
        myQueryOp.desiredKeys = ["CareRequestID", "RequestorID", "PatientID", "ServiceTime"]
        myQueryOp.resultsLimit = 10
        // querysortDescriptors = [] /* find out */
        print("Parameter personID \(personID) from ViewDidLoad to queryRecentCareRequests")
        
        var newExpenses = [Expense]()
        
        myQueryOp.recordFetchedBlock = { (record) in
            let recordID = record.recordID
            let CareRequestID = record["CareRequestID"] as! String
            let RequestorID = record["RequestorID"] as! String
            let PatientID = record["PatientID"] as! String
            let ServiceTime = record["ServiceTime"] as! NSDate
            let expense = newExpenses(CareRequestID: CareRequestID, RequestorID: RequestorID, PatientID: PatientID, ServiceTime: ServiceTime)
            newExpenses.append(expense)
        }
        
         publicDB.add(myQueryOp)
        
        myQueryOp.queryCompletionBlock = { (records, error) in
            guard let records = records else {return }
            
            DispatchQueue.main.async {
                print("The records are: \(records)")
                print("I made it to the Query Completion Block")
            }

        }
        

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

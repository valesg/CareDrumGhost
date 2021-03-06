//
//  TrafficCopViewController.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-10-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit
import CloudKit

var onDuty = "yes"

class TrafficCopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recentCareRequestsTable: UITableView!
    
    var myRecentCareRequests = [CKRecord]()
    var zrecentCareRequests = [CareRequestsRow]()
    
    let publicDB = CKContainer.default().publicCloudDatabase
    let privateDB = CKContainer.default().privateCloudDatabase
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return(recentcarerequests.count)
        print("Number of rows in the table: \(zrecentCareRequests.count)")
        return(zrecentCareRequests.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "recentcare")
        // cell.textLabel?.text = recentcarerequests[indexPath.row]
        // return(cell)
        print("kkkkkkkkk In TableView before assigning values to cell items")
        let cellIdentifier = "CareRequestsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CareRequestsTableViewCell else {
            fatalError("The dequeued cell is not an instance of CareRequestsTableViewCell")
        }
        
        let aRow = zrecentCareRequests[indexPath.row]
        
        cell.requestorIDLabel.text = aRow.requestorID
        print("AROW requestortID is: \(aRow.requestorID)")
        
        cell.patientIDlabel.text = aRow.patientID
        cell.serviceNameLabel.text = aRow.serviceName
        cell.serviceTimeLabel.text = "STime"
        
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        // Do any additional setup after loading the view.
        queryRecentCareRequests(personID: "PID-111")
        print("POST QUERY of RECENT CARE REQUESTS")
        
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
        let myPredicate = NSPredicate(format: "PatientID == %@", personID)
        //let myPredicate = NSPredicate(value: true)
        let mySort = NSSortDescriptor(key: "CareRequestID", ascending: true)
        let myQuery = CKQuery(recordType: "CareRequest", predicate: myPredicate)
        // For Sorts, ensure that the fields are indexed sortable
        myQuery.sortDescriptors = [mySort]
        
        let myQueryOp = CKQueryOperation(query: myQuery)
        myQueryOp.desiredKeys = ["CareRequestID", "RequestorID", "PatientID", "ServiceName", "ServiceTime", "Status"]
        myQueryOp.resultsLimit = 100
        
        // Remember that CloudKit does not return fields with no values
        
        myQueryOp.recordFetchedBlock = { (record) in
            let recordID = record.recordID
            let CareRequestID = record["CareRequestID"] as! String
            let RequestorID = record["RequestorID"] as! String
            let PatientID = record["PatientID"] as! String
            let ServiceTime = record["ServiceTime"] as! NSDate
            let Status = record["Status"] as! String
            let ServiceName = record["ServiceName"] as! String
            self.myRecentCareRequests.append(record)
            
            // trying to add rows to the tableview
            let photo1 = UIImage(named: "StatusOkLight")
            let zRow = CareRequestsRow(photo: photo1, requestorID: RequestorID, patientID: PatientID, careStatus: Status, serviceName: ServiceName, serviceTime: ServiceTime)
            self.zrecentCareRequests.append(zRow!)
            
            DispatchQueue.main.async {
                self.recentCareRequestsTable.reloadData()
                print(" Within recordFetchedBlock: \(self.myRecentCareRequests)")
                print("Individual field: CareRequestID is: \(CareRequestID), Status is: \(Status), ServiceName is: \(ServiceName)")
                print("zRow is: \(zRow?.requestorID)")
                print("Count of Z array: \(self.zrecentCareRequests.count)")
            }
        }
        
        publicDB.add(myQueryOp)
        
        myQueryOp.queryCompletionBlock = { (cursor, error) in
            guard let cursor = cursor else { return }
            DispatchQueue.main.async {
                print("More records to retrieve, see curor: \(cursor)")
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

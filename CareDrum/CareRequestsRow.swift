//
//  CareRequestsRow.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-11-13.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class CareRequestsRow {
    
    var photo: UIImage?
    var requestorID: String
    var patientID: String
    var careStatus: String
    var serviceName: String
    var serviceTime: NSDate

//MARK: Initialization

    init?(photo: UIImage?, requestorID: String, patientID: String, careStatus: String, serviceName: String, serviceTime: NSDate) {
    
    // Initialization should fail if the value of the properties are invalid
    if requestorID.isEmpty || patientID.isEmpty || careStatus.isEmpty {
        return nil
    }
    
    // Initialize stored properties
    self.photo = photo
    self.requestorID = requestorID
    self.patientID = patientID
    self.careStatus = careStatus
    self.serviceName = serviceName
    self.serviceTime = serviceTime
}
    
}

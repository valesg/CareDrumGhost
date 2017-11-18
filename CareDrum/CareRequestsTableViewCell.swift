//
//  CareRequestsTableViewCell.swift
//  CareDrum
//
//  Created by Guy Vales on 2017-11-16.
//  Copyright © 2017 Guy Vales. All rights reserved.
//

import UIKit

class CareRequestsTableViewCell: UITableViewCell {

    @IBOutlet weak var requestorIDLabel: UILabel!
    @IBOutlet weak var patientIDlabel: UILabel!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var serviceTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

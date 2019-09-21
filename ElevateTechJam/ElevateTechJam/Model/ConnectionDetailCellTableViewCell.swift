//
//  ConnectionDetailCellTableViewCell.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import UIKit

class ConnectionDetailCellTableViewCell: UITableViewCell {
    
    var userData: UserData? {
        
        didSet {
            guard let _userData = self.userData else { return }
            self.payButton.isHidden = !_userData.shouldDisplayCreditCard
            self.phoneNumber.text = _userData.phoneNumber
            self.amount.text = _userData.amount
        }
        
    }
    @IBOutlet weak var roundedView: ElevateRoundedView! {
        didSet {
            self.roundedView.layer.borderColor = UIColor.red.cgColor
             self.roundedView.layer.borderWidth = 1.0
             self.roundedView.layer.cornerRadius = 16.0
            
        }
    }
    
    @IBOutlet weak var payButton: ElevateButton!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

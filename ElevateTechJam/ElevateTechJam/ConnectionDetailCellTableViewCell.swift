//
//  ConnectionDetailCellTableViewCell.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import UIKit

class ConnectionDetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneListViewHeight: NSLayoutConstraint!
    @IBOutlet weak var phoneListView: UIView!
    var cardData: CardDetail? {

        didSet {
            guard let _cardData = self.cardData else { return }
            self.payButton.isHidden = false//!_userData.shouldDisplayCreditCard
            self.phoneNumber.text = _cardData.card
            self.amount.text = _cardData.amount
            self.nameLabel.text = _cardData.name

            var top:CGFloat = 0.0
            for data: UserData in _cardData.data {
                let button = UIButton()
                button.setTitle(data.name + " (" + data.phoneNumber + ")", for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = .white
                phoneListView.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = false
                let leading = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: phoneListView, attribute: .leading, multiplier: 1.0, constant: 0.0)
                let trailing = NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: phoneListView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
                let topC = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: phoneListView, attribute: .top, multiplier: 1.0, constant: top)
                let height = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0)
                button.addConstraints([height])
                phoneListView.addConstraints([leading, trailing, topC])
                top = top + 58.0
                button.layer.borderColor = UIColor.blue.cgColor
                button.layer.borderWidth = 1.0
                button.layer.cornerRadius = 25.0
            }

            phoneListViewHeight.constant = top
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
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

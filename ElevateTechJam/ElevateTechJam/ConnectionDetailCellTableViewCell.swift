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

    weak var detailVC: DetailViewController?
    var phoneList = [UserData]()
    var cardData: CardDetail? {

        didSet {
            guard let _cardData = self.cardData else { return }
            self.phoneNumber.text = _cardData.card
            self.nameLabel.text = _cardData.name

            self.phoneList = _cardData.data
            self.updatePhoneList()
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

    func updatePhoneList() {
        var top:CGFloat = 0.0
        var tag = 0
        let subviews1 = phoneListView.subviews
        for subview in subviews1 {
            subview.removeFromSuperview()
        }
        for data: UserData in self.phoneList {
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
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 25.0
            button.tag = tag
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            top = top + 58.0
            tag = tag + 1
        }

        self.amount.text = "$\(self.phoneList.count * 90).00"

        phoneListViewHeight.constant = top

    }

    @objc func didTapButton(_ sender: UIButton) {
        detailVC!.moveFromCell(cell: self, index: sender.tag)
    }
}

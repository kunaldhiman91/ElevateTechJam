//
//  ViewController.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//
 
import UIKit

class ViewController: UIViewController {

    let vm = DeviceViewModel()
    
    @IBOutlet weak var parentView: UIView! {
        didSet {
            self.parentView.layer.borderColor = UIColor.red.cgColor
            self.parentView.layer.borderWidth = 1
            self.parentView.layer.cornerRadius = 16.0
        }
    }
    
    
    @IBAction func didTapPayment(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.memberData = vm.memberDetail
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
    }
    @IBOutlet weak var billButton: ElevateButton!
    
    @IBOutlet weak var viewBill: ElevateButton! {
        didSet {
            self.viewBill.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getDeviceData()
        
    }
}


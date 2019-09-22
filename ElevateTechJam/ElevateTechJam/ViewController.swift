//
//  ViewController.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//
 
import UIKit
import UserNotifications

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
            self.viewBill.layer.borderWidth = 1
            //self.viewBill.layer.cornerRadius = 16.0
        }
    }
    
    @IBAction func didTapViewBill(_ sender: Any) {
        
        self.scheduleNotification()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
        
        vm.getDeviceData()
        
    }
    
    func scheduleNotification() {
     
        let content = UNMutableNotificationContent()
        content.title = "Data Overuse!!!"
        content.subtitle = ""
        content.body = " You have consumed 80% of your wireless data. Log in to Rogers mobile app to top up and avoid extra charges."
        
        // 2
        let imageName = "rogers"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }
    
}


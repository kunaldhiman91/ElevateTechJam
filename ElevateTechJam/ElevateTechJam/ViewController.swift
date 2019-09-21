//
//  ViewController.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//
 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let vm = DeviceViewModel()
        if let deviceData = vm.getDeviceData() {
            
            print(deviceData.devicesMap.preOwned.modelMap.prod1220510.displayName.en)
            
        }
        
    }
}


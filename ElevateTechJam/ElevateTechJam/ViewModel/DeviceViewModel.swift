//
//  DeviceViewModel.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import Foundation

class DeviceViewModel {
    
    var memberDetail: MemberDetail = MemberDetail(data: [])
    
    var data: [UserData] = [UserData]()
    
    func getDeviceData() {
        if let url = Bundle.main.url(forResource: "devices", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MemberDetail.self, from: data)
                self.memberDetail = jsonData
                self.data = jsonData.data
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
    }
}

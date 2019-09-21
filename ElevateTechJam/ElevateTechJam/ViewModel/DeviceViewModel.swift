//
//  DeviceViewModel.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import Foundation

class DeviceViewModel {
    func getDeviceData() -> Todos? {
        if let url = Bundle.main.url(forResource: "devices", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Todos.self, from: data)
                return jsonData
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

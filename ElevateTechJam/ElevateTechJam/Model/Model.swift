//
//  Model.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import Foundation

struct MemberDetail: Codable {
   
    var data: [CardDetail]

    func indexOfCardWithNumber(number:String) -> Int {
        for i: Int in 0..<data.count {
            if data[i].card == number {
                return i
            }
        }
        return -1
    }
}

struct CardDetail: Codable {
    let name: String?
    let card: String?
    var data: [UserData]
}

struct UserData: Codable {
    let name: String
    let phoneNumber: String
    let amount: String
    let shouldDisplayCreditCard: Bool
}

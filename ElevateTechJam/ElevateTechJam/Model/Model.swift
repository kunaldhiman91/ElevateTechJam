//
//  Model.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import Foundation

struct MemberDetail: Codable {
   
    let data: [CardDetail]
}

struct CardDetail: Codable {
    let name: String?
    let card: String?
    let amount: String?
    let data: [UserData]
}

struct UserData: Codable {
    let name: String
    let phoneNumber: String
    let amount: String
    let shouldDisplayCreditCard: Bool
}

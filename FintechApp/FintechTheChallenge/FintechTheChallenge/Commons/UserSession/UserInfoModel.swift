//
//  UserInfoModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/01/22.
//

import Foundation

struct UserInfo: Decodable {
    let userName: String
    let accountCode: String
    let email: String
    let useCoins: Int
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case accountCode = "account_code"
        case useCoins = "use_coins"
        case email = "email"
        case photo = "photo"
    }
}

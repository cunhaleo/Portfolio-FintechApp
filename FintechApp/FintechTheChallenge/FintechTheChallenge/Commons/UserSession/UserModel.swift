//
//  Model.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/12/21.
//

import Foundation

struct UserModel: Decodable {
    let userInfo: UserInfo
    let userCredentials: UserCredentials
    let hasNotification: Bool
    
    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
        case userCredentials = "user_credentials"
        case hasNotification = "has_notifications"
    }
}

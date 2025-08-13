//
//  UserCredentialsModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/01/22.
//

import Foundation

struct UserCredentials: Decodable {
    let login: String?
    let password: String?
}

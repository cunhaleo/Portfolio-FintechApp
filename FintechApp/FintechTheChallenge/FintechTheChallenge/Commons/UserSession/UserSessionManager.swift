//
//  UserSessionManager.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 09/12/21.
//

import UIKit

final class UserSessionManager {
    // MARK: Properties
    static let shared = UserSessionManager()
    
    enum Keys: String {
        case userName = "keyUsarName"
        case accountCode = "keyAccountCode"
        case email = "keyEmail"
        case photo = "keyPhoto"
        case useCoins = "keyUseCoins"
    }
    
    var userName: String? {
        get {
            UserDefaults.standard.string(forKey: Keys.userName.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.userName.rawValue)
        }
    }
    
    var accountCode: String? {
        get {
            UserDefaults.standard.string(forKey: Keys.accountCode.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.accountCode.rawValue)
        }
    }
    
    var email: String? {
        get {
            UserDefaults.standard.string(forKey: Keys.email.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.email.rawValue)
        }
    }
    
    var photo: String? {
        get {
            UserDefaults.standard.string(forKey: Keys.photo.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.photo.rawValue)
        }
    }
    
    var useCoins: Int? {
        get {
            UserDefaults.standard.integer(forKey: Keys.useCoins.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.useCoins.rawValue)
        }
    }
    
    var hasSession: Bool {
        return accountCode != nil && userName != nil && email != nil
    }
    
    // MARK: Methods
    func startSession(user: UserModel?) {
        self.userName = user?.userInfo.userName
        self.accountCode = user?.userInfo.accountCode
        self.email = user?.userInfo.email
        self.photo = user?.userInfo.photo
        self.useCoins = user?.userInfo.useCoins
    }
    
    func logout() {
        userName = nil
        accountCode = nil
        email = nil
        photo = nil
        useCoins = nil
    }
}

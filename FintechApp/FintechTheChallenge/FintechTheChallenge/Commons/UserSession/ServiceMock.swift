//
//  File.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 15/08/25.
//

import Foundation

final class ServiceMock: Service {
    
    // MARK: - Variables & Attributes
    let userCredentials: UserCredentials = UserCredentials(login: "Leonardo",
                                                           password: "Cunha")
    let userInfo: UserInfo = UserInfo(userName: "Leonardo",
                                      accountCode: "44235",
                                      email: "cunhacardosoleo@gmail.com",
                                      useCoins: 8332,
                                      photo: nil)
    lazy var userModel: UserModel = UserModel(userInfo: userInfo,
                                              userCredentials: userCredentials,
                                              hasNotification: true)
    
    //MARK: - Overrides
    
    
    override func loginUser(login: String,
                            password: String,
                            completion: @escaping ((UserModel?, String?) -> Void)) {
        shouldShowProgressScreen?(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.shouldShowProgressScreen?(false)
            completion(self.userModel, nil)
        }
    }
}

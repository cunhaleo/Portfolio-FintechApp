//
//  HomeViewModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 05/01/22.
//

import UIKit

final class HomeViewModel {
    // MARK: Properties
    let model: HomeModel
    
    // MARK: Initialization
    init() {
        self.model = HomeModel(userName: UserSessionManager.shared.userName ?? "",
                               accountCode: UserSessionManager.shared.accountCode ?? "")
    }
    
    // MARK: Methods
    func getUserFirstName() -> String {
        let firstName = model.userName.getFirstWord(separatedBy: " ")
        return firstName
    }
}

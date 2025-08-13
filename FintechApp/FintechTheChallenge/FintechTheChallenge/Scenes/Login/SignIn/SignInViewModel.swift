//
//  SignInViewModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/12/21.
//

import UIKit

final class SignInViewModel {
    // MARK: Properties
    private var service: Service
    var shouldShowProgressScreen: ((Bool) -> Void)?
    private var model: UserModel?
    var handleSuccess: (() -> Void)?
    var handleError: ((String) -> Void)?
    
    // MARK: Initialization
    init(service: Service = Service()) {
        self.service = service
    }
    
    // MARK: Methods
    func areSignInTextFieldsFilled(user: String, password: String) -> Bool {
        !(user.isEmpty || password.isEmpty)
    }
    
    // MARK: Service
    func getService(login: String, password: String) {
        shouldShowProgressScreen?(true)
        service.loginUser(login: login, password: password) { [weak self] model, erro in
            self?.shouldShowProgressScreen?(false)
            if let error = erro {
                self?.handleError?(error)
            } else {
                self?.model = model
                guard self?.model != nil else { return }
                UserSessionManager.shared.startSession(user: model)
                if UserSessionManager.shared.hasSession {
                    self?.handleSuccess?()
                }
            }
        }
    }
}

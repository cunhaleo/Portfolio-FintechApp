//
//  AppCoordinator.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 09/12/21.
//

import UIKit

final class LoginCoordinator: Coordinator {
    // MARK: Properties
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var rootViewController: UIViewController?
    
    // MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: Methods
    func start() {
        if UserSessionManager.shared.hasSession {
            goToHome()
        }
        else {
            goToLogin()
        }
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: false)
    }
    
    func goToHome() {
        let child = HomeCoordinator(navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

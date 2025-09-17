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
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        rootViewController = loginViewController
        UserSessionManager.shared.hasSession ? goToHome() : goToLogin()
    }
    
    func goToLogin() {
        guard let rootViewController = rootViewController else { return }
        DispatchQueue.main.async {
            self.navigationController.pushViewController(rootViewController, animated: false)
        }
    }
    
    func goToHome() {
        let child = HomeCoordinator(navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

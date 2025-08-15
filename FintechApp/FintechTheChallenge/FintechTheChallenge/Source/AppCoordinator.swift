//
//  AppCoordinator.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 09/12/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: Properties
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var rootViewController: UIViewController?
    
    // MARK: Initialization
    init() {
        navigationController = UINavigationController()
    }
    
    // MARK: Methods
    func start() {
        if UserSessionManager.shared.hasSession {
            goToHome()
        } else {
            goToLogin()
        }
        UIApplication.switchRootViewController(navigationController, animated: true, completion: nil)
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigationController)
        homeCoordinator.start()
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController()
        navigationController = UINavigationController(rootViewController: loginViewController)
        loginViewController.coordinator = self
    }
}

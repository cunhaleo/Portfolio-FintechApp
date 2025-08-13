//
//  LoginCoordinator.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 09/12/21.
//

import UIKit

final class LoginCoordinator: Coordinator {
    // MARK: Properties
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var rootViewController: UIViewController?
    
    // MARK: Initialization
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    func start() {
        let viewController = SignInViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToHomeIfHasSession() {
        let appCoordinator = AppCoordinator()
        appCoordinator.start()
    }
}

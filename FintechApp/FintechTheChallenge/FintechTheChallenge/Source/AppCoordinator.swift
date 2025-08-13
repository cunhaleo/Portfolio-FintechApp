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
            let homeCoordinator = HomeCoordinator(navigationController)
            homeCoordinator.start()
        } else {
            let loginCoordinator = LoginCoordinator(navigationController)
            loginCoordinator.start()
        }
        UIApplication.switchRootViewController(navigationController, animated: true, completion: nil)
    }
}

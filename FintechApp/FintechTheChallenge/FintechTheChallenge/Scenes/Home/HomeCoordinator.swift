//
//  HomeCoordinator.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 09/12/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
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
        let viewController = HomeContainerViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToLoginIfHasNoSession() {
        let appCoordinator = AppCoordinator()
        appCoordinator.start()
    }
    
    func popToHome() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func goToMyCardViewController() {
        let viewController = MyCardViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToCheckInHistoricViewController() {
        let viewController = CheckInHistoricViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToAboutAppViewController() {
        let viewController = AboutAppViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

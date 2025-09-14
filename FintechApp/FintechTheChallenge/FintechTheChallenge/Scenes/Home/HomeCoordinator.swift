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
    weak var parentCoordinator: Coordinator?
    var rootViewController: UIViewController?
    
    // MARK: Initialization
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    func start() {
        let homeContainer = HomeContainerViewController()
        navigationController.pushViewController(homeContainer, animated: false)
        homeContainer.coordinator = self
    }
    
    func goToLogin() {
        parentCoordinator?.finishChild(self)
        navigationController.popToRootViewController(animated: false)
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

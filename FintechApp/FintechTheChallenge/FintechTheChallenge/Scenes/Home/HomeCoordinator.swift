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
        DispatchQueue.main.async {
            self.addLoginAnimation()
            self.navigationController.pushViewController(homeContainer, animated: false)
        }
        homeContainer.coordinator = self
    }
    
    func goToLogin() {
        parentCoordinator?.finishChild(self)
        DispatchQueue.main.async {
            self.addLogoutAnimation()
            self.navigationController.popToRootViewController(animated: false)
        }
    }
    
    func popToHome() {
        navigationController.popToRootViewController(animated: false)
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
    
    private func addLogoutAnimation() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .reveal
        transition.subtype = .fromBottom
        navigationController.view.layer.add(transition, forKey: kCATransition)
    }
    
    private func addLoginAnimation() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .reveal
        transition.subtype = .fromTop
        navigationController.view.layer.add(transition, forKey: kCATransition)
    }
}

//
//  Coordinator.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/12/21.
//

import UIKit

protocol Coordinator: AnyObject {
    // MARK: Properties
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator] {get set}
    var parentCoordinator: Coordinator? {get set}
    var rootViewController: UIViewController? {get set}
    
    func start()
}

extension Coordinator {
    func finishChild(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func popToRootViewController(animated: Bool) {
        guard let rootViewController = rootViewController else { return }
        if navigationController.viewControllers.contains(rootViewController) {
            navigationController.popToViewController(rootViewController, animated: animated)
        } else {
            navigationController.viewControllers.append(rootViewController)
        }
    }
}

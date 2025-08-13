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

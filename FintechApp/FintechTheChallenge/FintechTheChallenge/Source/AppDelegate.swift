//
//  AppDelegate.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 02/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties
    var window: UIWindow?
    var coordinator: Coordinator?
    
    // MARK: Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()
        coordinator = LoginCoordinator(navigationController: navController)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

// MARK: Extensions
extension UIApplication {
    static func switchRootViewController(_ rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let window = UIApplication.shared.windows.first else { return }
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { finished in
                if finished {
                    completion?()
                }
            })
        } else {
            window.rootViewController = rootViewController
            completion?()
        }
    }
}

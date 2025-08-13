//
//  ContainerViewController.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 09/06/22.
//

import UIKit

final class HomeContainerViewController: BaseViewController {
    enum SideMenuState {
        case closed
        case opened
    }
    
    // MARK: Properties
    private let homeViewController = HomeViewController()
    private let sideMenuViewController = SideMenuViewController()
    var coordinator: HomeCoordinator?
    private var sideMenuState: SideMenuState = .closed
    var navController: UINavigationController?
    
    private lazy var sideMenuStartPosition: CGFloat = {
        let startPosition = -sideMenuViewController.view.frame.width
        return startPosition
    }()
    
    let sideMenuOpenedPosition: CGFloat = 0
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCoordinators()
        addChiledViewControllers()
        setupSideMenuStartPosition()
        enableGestureRecognizers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        setupDefaultNavigationBar()
    }
    
    // MARK: Methods
    private func setupCoordinators() {
        sideMenuViewController.coordinator = coordinator
        homeViewController.coordinator = coordinator
    }

    private func addChiledViewControllers() {
        // SideMenuViewController
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
        
        // HomeViewController
        homeViewController.delegate = self
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        addChild(homeNavigationController)
        view.addSubview(homeNavigationController.view)
        homeNavigationController.didMove(toParent: self)
        self.navController = homeNavigationController
    }
    
    private func setupSideMenuStartPosition() {
        view.bringSubviewToFront(sideMenuViewController.view)
        sideMenuViewController.view.frame.origin.x = sideMenuStartPosition
    }
    
}

// MARK: Extensions
extension HomeContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        switch sideMenuState {
        case .closed:
            openSideMenu()
        case .opened:
            closeSideMenu()
        }
    }
}

private extension HomeContainerViewController {
    func openSideMenu() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.homeViewController.view.alpha = 0.5
            self.sideMenuViewController.view.frame.origin.x = self.sideMenuOpenedPosition
        } completion: { [weak self] completed in
            if completed {
                self?.sideMenuState = .opened
            }
        }
    }
    
    func closeSideMenu() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.sideMenuViewController.view.frame.origin.x = self.sideMenuStartPosition
            self.homeViewController.view.alpha = 1
            
        } completion: { [weak self] completed in
            if completed {
                self?.sideMenuState = .closed
            }
        }
    }
}

extension HomeContainerViewController: UIGestureRecognizerDelegate {
    private func enableGestureRecognizers() {
        enableTapGestureRecognizer()
        enablePanGestureRecognizer()
    }
    
    private func enablePanGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGesture.delegate = self
        view.addGestureRecognizer(panGesture)
    }
        
    private func enableTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tapGesture.delegate = self
        sideMenuViewController.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        if sideMenuState == .opened {
            closeSideMenu()
        }
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        let position: CGFloat = sender.translation(in: self.view).x
        
        switch sender.state {
        case .changed:
            if sideMenuViewController.view.frame.origin.x <= sideMenuOpenedPosition,
               sideMenuViewController.view.frame.origin.x >= sideMenuStartPosition {
                sender.setTranslation(CGPoint.zero, in: view)
                let newPosition = sideMenuViewController.view.frame.origin.x + position
                guard newPosition < 0 else { return }
                sideMenuViewController.view.frame.origin.x = newPosition
            }
            
        case .ended:
            if sideMenuViewController.view.frame.origin.x > -(0.4*sideMenuViewController.view.frame.width) {
                openSideMenu()
            } else {
                closeSideMenu()
            }
            
        @unknown default:
            break
        }
    }
}

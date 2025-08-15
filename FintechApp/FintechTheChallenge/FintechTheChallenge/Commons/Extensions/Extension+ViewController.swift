//
//  Extension+ViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/12/21.
//

import UIKit

public extension UIViewController {
    // MARK: Methods
    func showProgressScreen() {
        let progress = ProgressViewController()
        progress.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(progress, animated: true)
        }
    }
    
    func dismissProgressScreen() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func uiColorCyan() -> UIColor {
        UIColor(red: 0.23, green: 0.81, blue: 0.93, alpha: 1.00)
    }
    
    func uiColorLightGray() -> UIColor {
        UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
    }
}

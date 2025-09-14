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
        let frame = UIScreen.main.bounds
        let progress = ProgressView(frame: frame)
        
        DispatchQueue.main.async {
            self.view.addSubview(progress)
        }
    }
    
    func dismissProgressScreen() {
        for subview in self.view.subviews {
            if subview is ProgressView {
                DispatchQueue.main.async {
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func uiColorCyan() -> UIColor {
        UIColor(red: 0.23, green: 0.81, blue: 0.93, alpha: 1.00)
    }
    
    func uiColorLightGray() -> UIColor {
        UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
    }
}

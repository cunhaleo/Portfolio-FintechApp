//
//  Extension+UIView.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 17/03/22.
//

import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func fadeIn(duration: TimeInterval = 0.5) {
         UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
         })
     }

    func fadeOut(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
      }
}

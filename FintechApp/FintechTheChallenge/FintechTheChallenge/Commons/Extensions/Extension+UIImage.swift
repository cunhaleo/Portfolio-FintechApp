//
//  Extension+UIImage.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 26/05/22.
//

import UIKit

extension UIImage {
    func imageWithColor(color: UIColor? = .white) -> UIImage? {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color?.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

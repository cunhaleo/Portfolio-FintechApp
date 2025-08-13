//
//  ImageAssets.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 26/09/22.
//

import UIKit

fileprivate enum ImageNames {
    static let steveProfile = "photo_steve"
    static let bigLogo = "logoBig_usemobile"
    static let roundedSteve = "roundedSteve"
}

extension UIImage {
    static func steveProfile() -> UIImage { UIImage(named: ImageNames.steveProfile) ?? UIImage() }
    static func bigLogo() -> UIImage { UIImage(named: ImageNames.bigLogo) ?? UIImage() }
    static func steveRounded() -> UIImage { UIImage(named: ImageNames.roundedSteve) ?? UIImage() }
}

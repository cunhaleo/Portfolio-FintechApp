//
//  CustomFonts.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 01/08/22.
//

import UIKit

extension UIFont {
    static func interFamily(_ fontName: InterFonts, size: CGFloat) -> UIFont {
        UIFont(name: fontName.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    enum InterFonts: String {
        case regular = "InterV"
        case regularItalic = "InterV_Italic"
        case thin = "InterV_Thin"
        case thinItalic = "InterV_Thin-Italic"
        case extraLight = "InterV_Extra-Light"
        case extraLightItalic = "InterV_Extra-Light-Italic"
        case light = "InterV_Light"
        case lightItalic = "InterV_Light-Italic"
        case medium = "InterV_Medium"
        case mediumItalic = "InterV_Medium-Italic"
        case semiBold = "InterV_Semi-Bold"
        case semiBoldItalic = "InterV_Semi-Bold-Italic"
        case bold = "InterV_Bold"
        case boldItalic = "InterV_Bold-Italic"
        case extraBold = "InterV_Extra-Bold"
        case extraBoldItalic = "InterV_Extra-Bold-Italic"
        case black = "InterV_Black"
        case blackItalic = "InterV_Black-Italic"
    }
}

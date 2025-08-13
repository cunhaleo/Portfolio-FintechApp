//
//  BaseViewController.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 13/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    func setupDefaultNavigationBar() {
        let primaryColor: UIColor = UIColor.primaryColor()
        let fontColor: UIColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backgroundColor = primaryColor
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: fontColor]
        self.navigationController?.navigationBar.tintColor = fontColor

        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: fontColor]
            appearance.backgroundColor = primaryColor
            self.navigationController?.navigationBar.compactAppearance = appearance
            self.navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

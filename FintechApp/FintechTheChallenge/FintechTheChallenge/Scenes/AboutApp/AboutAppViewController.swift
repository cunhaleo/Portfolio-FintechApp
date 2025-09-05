//
//  AboutAppViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/01/22.
//

import UIKit

final class AboutAppViewController: UIViewController {
    // MARK: Properties
    var coordinator: HomeCoordinator?
    
    // MARK: Outlets
    @IBOutlet weak var viewOutApp: UIView!
    @IBOutlet weak var viewYourDevice: UIView!
    @IBOutlet weak var labelOperatingSystem: UILabel!
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelManufacturer: UILabel!
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var buttonUpdateApp: UIButton!
    @IBOutlet weak var labelActualVersion: UILabel!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDeviceSettings()
    }
    
    private func setupUI() {
        title = "Sobre o aplicativo"
        viewOutApp.layer.borderWidth = 1
        viewOutApp.layer.borderColor = UIColor.lightGray.cgColor
        viewOutApp.layer.cornerRadius = 20
        viewYourDevice.layer.borderWidth = 1
        viewYourDevice.layer.borderColor = UIColor.lightGray.cgColor
        viewYourDevice.layer.cornerRadius = 20
        buttonUpdateApp.layer.cornerRadius = 25
        buttonUpdateApp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private func setupDeviceSettings() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        labelActualVersion.text = appVersion?.description
        let device = UIDevice.current
        labelVersion.text = device.systemVersion
        labelOperatingSystem.text = device.systemName
        labelModel.text = device.name
        labelManufacturer.text = "Apple"
    }
}

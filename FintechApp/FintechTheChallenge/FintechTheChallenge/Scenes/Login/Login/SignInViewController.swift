//
//  LoginViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 02/12/21.
//

import UIKit
import Lottie

final class LoginViewController: UIViewController {
    // MARK: Properties
    private var viewModel: LoginViewModel
    var coordinator: AppCoordinator?
    private var isPasswordShowing = false {
        didSet {
            textFieldPassword.isSecureTextEntry.toggle()
            let title = isPasswordShowing ? "Ocultar" : "Mostrar"
            buttonShowPassword.setTitle(title, for: .normal)
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonShowPassword: UIButton!
    @IBOutlet weak var labelInvalidUserPassword: UILabel!
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Initialization
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindEvents()
    }
    
    // MARK: Actions
    @IBAction func handlerSignInButton(_ sender: Any) {
        let login = textFieldUser.text ?? ""
        let password = textFieldPassword.text ?? ""
        viewModel.getService(login: login, password: password)
    }
    
    @IBAction func handlerShowPasswordButton(_ sender: Any) {
        isPasswordShowing.toggle()
    }
    
    @IBAction func textFieldUserEditingChanged(_ sender: UITextField) {
        signInButtonSetup()
    }
    
    @IBAction func textFieldPasswordEditingChanged(_ sender: UITextField) {
        signInButtonSetup()
    }
    
    // MARK: Methods
    func bindEvents() {
        viewModel.shouldShowProgressScreen = { [weak self] shouldShow in
            shouldShow ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            
        }
        
        viewModel.handleError = { [weak self] _ in
            DispatchQueue.main.async {
                self?.labelInvalidUserPassword.isHidden = false
            }
        }
        
        viewModel.handleSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.coordinator?.start()
            }
        }
    }
    
    private func signInButtonSetup() {
        buttonSignIn.isEnabled = viewModel.areSignInTextFieldsFilled(user: textFieldUser.text ?? "", password: textFieldPassword.text ?? "")
        buttonSignIn.backgroundColor = buttonSignIn.isEnabled ? UIColor.secondaryColor() : uiColorLightGray()
    }
    
    private func setupUI() {
        buttonSignIn.layer.cornerRadius = 25
        buttonSignIn.isEnabled = false
        activityIndicator.hidesWhenStopped = true
    }
}

//
//  SignInViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 02/12/21.
//

import UIKit
import Lottie

final class SignInViewController: UIViewController {
    // MARK: Properties
    private var viewModel: SignInViewModel
    var coordinator: LoginCoordinator?
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
    
    // MARK: Initialization
    init(viewModel: SignInViewModel = SignInViewModel()) {
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
        viewModel.getService(login: "usemobile", password: "useop")
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
            shouldShow ? self?.showProgressScreen() : self?.dismissProgressScreen()
        }
        
        viewModel.handleError = { [weak self] _ in
            DispatchQueue.main.async {
                self?.labelInvalidUserPassword.isHidden = false
            }
        }
        
        viewModel.handleSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.coordinator?.goToHomeIfHasSession()
            }
        }
    }
    
    private func signInButtonSetup() {
        buttonSignIn.isEnabled = viewModel.areSignInTextFieldsFilled(user: textFieldUser.text ?? "", password: textFieldPassword.text ?? "")
        buttonSignIn.backgroundColor = buttonSignIn.isEnabled ? uiColorCyan() : uiColorLightGray()
    }
    
    private func setupUI() {
        buttonSignIn.layer.cornerRadius = 25
        buttonSignIn.isEnabled = false
    }
}

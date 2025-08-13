//
//  CustomAlertViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/06/22.
//

import UIKit

final class CustomAlertViewController: UIViewController {
    // MARK: Properties
    private var titleAlert: String?
    private var message: String?
    private var titleButtonPrimary: String?
    private var titleButtonSecondary: String?
    private var customView: UIView?
    private var stackHeight: CGFloat?
    private var stackWidth: CGFloat?
    private var handlePrimaryButton: ((CustomAlertViewController) -> Void)?
    private var handleSecondaryButton: ((CustomAlertViewController) -> Void)?
    
    // MARK: Outlets
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewAlertContent: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var buttonPrimary: UIButton!
    @IBOutlet weak var buttonSecondary: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Actions
    @IBAction func handleButtonPrimary(_ sender: Any) {
        handlePrimaryButton?(self)
    }
    
    @IBAction func handleSecondaryButton(_ sender: Any) {
        handleSecondaryButton?(self)
    }
    
    // MARK: Setups
    private func setupUI() {
        labelTitle.text = titleAlert
        labelMessage.text = message
        buttonPrimary.setTitle(titleButtonPrimary, for: .normal)
        buttonSecondary.setTitle(titleButtonSecondary ?? "Cancelar", for: .normal)
        buttonSecondary.titleLabel?.lineBreakMode = .byWordWrapping
        buttonSecondary.titleLabel?.textAlignment = .center
        buttonPrimary.layer.cornerRadius = 25
        buttonSecondary.layer.cornerRadius = 25
        viewAlertContent.layer.cornerRadius = 15
        setupCustomView()
    }
    
    private func setupCustomView() {
        if let view = customView,
        let stackHeight = stackHeight,
        let stackWidth = stackWidth {
            stackViewHeight.constant = stackHeight
            stackViewWidth.constant = stackWidth
            stackView.addSubview(view)
        }
    }
    
    // MARK: Methods
    private func allRequiredAlertComponentsAreFilled() -> Bool {
        guard let titleAlert = titleAlert, !titleAlert.isEmpty,
              let message = message, !message.isEmpty,
              let titleButtonPrimary = titleButtonPrimary,
              let titleButtonSecondary = titleButtonSecondary,
              !titleButtonSecondary.isEmpty,
              !titleButtonPrimary.isEmpty else {
            return false
        }
        return true
    }
    
    @discardableResult
    func setTitleAlert(_ title: String) -> Self {
        titleAlert = title
        return self
    }
    
    @discardableResult
    func setMessage(_ message: String) -> Self {
        self.message = message
        return self
    }
    
    @discardableResult
    func setTitlePrimaryButton(_ title: String) -> Self {
        titleButtonPrimary = title
        return self
    }
    
    @discardableResult
    func setTitleSecondaryButton(_ title: String) -> Self {
        titleButtonSecondary = title
        return self
    }
    
    @discardableResult
    func addCustomView(_ view: UIView) -> Self {
        stackWidth = view.frame.width
        stackHeight = view.frame.height
        customView = view
        return self
    }
    
    func handlerButtonPrimary(_ didAction: @escaping (CustomAlertViewController) -> Void) -> Self {
        handlePrimaryButton = didAction
        return self
    }
    
    func handlerButtonSecondary(_ didAction: @escaping (CustomAlertViewController) -> Void) -> Self {
        handleSecondaryButton = didAction
        return self
    }
    
    func show(_ target: UIViewController) {
        guard allRequiredAlertComponentsAreFilled() else { return }
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        target.present(self, animated: true, completion: nil)
    }
}

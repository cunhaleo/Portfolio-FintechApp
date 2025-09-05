//
//  SideMenuViewController.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 09/06/22.
//

import UIKit

enum Layout {
    static let sideMenuRightPadding: CGFloat = 100
}

final class SideMenuViewController: UIViewController {

    var coordinator: HomeCoordinator?

    private lazy var scrollView: UIScrollView = {
        let scrowView = UIScrollView()
        scrowView.backgroundColor = .red
        scrowView.showsVerticalScrollIndicator = false
        scrowView.translatesAutoresizingMaskIntoConstraints = false
        return scrowView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.primaryColor()
        return contentView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.primaryColor()
        stackView.spacing = 1
        return stackView
    }()
    
    private lazy var header: SideMenuHeaderView = {
        let header = SideMenuHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.title = "Usemobile"
        header.topDescription = "Challenge"
        header.backgroundColor = UIColor.primaryColor()
        return header
    }()
    
    private lazy var userView: SideMenuUserView = {
        let userView = SideMenuUserView()
        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.addLeftImage(UIImage(named: "icon_apple")?.imageWithColor(color: .white) ?? UIImage())
        userView.username = UserSessionManager.shared.userName
        userView.account = UserSessionManager.shared.accountCode
        userView.didPressUserView = { [weak self] in
            self?.openUserBottomSheet()
        }
        return userView
    }()
    
    private lazy var macroViewCheckInHistory: SideMenuMacroItemView = {
        let macroItem = SideMenuMacroItemView()
        macroItem.translatesAutoresizingMaskIntoConstraints = false
        macroItem.addLeftImage(UIImage(named: "icon_apple")?.imageWithColor(color: UIColor.darkGray) ?? UIImage())
        macroItem.descriptionText = "Histórico de Check-in"
        macroItem.didPressSingleItem = { [weak self] in
            self?.coordinator?.goToCheckInHistoricViewController()
        }
        return macroItem
    }()
    
    private lazy var macroViewMyClients: SideMenuMacroItemView = {
        let macroItem = SideMenuMacroItemView()
        macroItem.translatesAutoresizingMaskIntoConstraints = false
        macroItem.addLeftImage(UIImage(named: "icon_apple")?.imageWithColor(color: UIColor.darkGray) ?? UIImage())
        macroItem.descriptionText = "Meus clientes"
        macroItem.microItems = [microViewAddClient]
        return macroItem
    }()
    
    private lazy var microViewAddClient: SideMenuMicroItemView = {
        let microItem = SideMenuMicroItemView()
        microItem.translatesAutoresizingMaskIntoConstraints = false
        microItem.descriptionText = "Adicionar Cliente"
        microItem.didPressItem = {
            // goToWriteQRCode
        }
        return microItem
    }()
    
    private lazy var macroViewQrCode: SideMenuMacroItemView = {
        let macroItem = SideMenuMacroItemView()
        macroItem.translatesAutoresizingMaskIntoConstraints = false
        macroItem.addLeftImage(UIImage(named: "icon_apple")?.imageWithColor(color: UIColor.darkGray) ?? UIImage())
        macroItem.descriptionText = "QR Code"
        macroItem.microItems = [microViewReadQrCode, microViewWriteQrCode]
        return macroItem
    }()
    
    private lazy var microViewReadQrCode: SideMenuMicroItemView = {
        let microItem = SideMenuMicroItemView()
        microItem.translatesAutoresizingMaskIntoConstraints = false
        microItem.descriptionText = "Ler QR Code"
        microItem.didPressItem = {
            // goToWriteQRCode
        }
        return microItem
    }()
    
    private lazy var microViewWriteQrCode: SideMenuMicroItemView = {
        let microItem = SideMenuMicroItemView()
        microItem.translatesAutoresizingMaskIntoConstraints = false
        microItem.descriptionText = "Escrever QR Code"
        microItem.didPressItem = {
            // goToWriteQRCode
        }
        return microItem
    }()
    
    private lazy var macroViewAboutApp: SideMenuMacroItemView = {
       let macroItem = SideMenuMacroItemView()
        macroItem.translatesAutoresizingMaskIntoConstraints = false
        macroItem.addLeftImage(UIImage(named: "icon_apple")?.imageWithColor(color: UIColor.darkGray) ?? UIImage())
        macroItem.descriptionText = "Sobre o app"
        macroItem.didPressSingleItem = { [weak self] in
            self?.coordinator?.goToAboutAppViewController()
        }
        return macroItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
}

extension SideMenuViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(header)
        stackView.addArrangedSubview(userView)
        stackView.addArrangedSubview(macroViewMyClients)
        stackView.addArrangedSubview(macroViewCheckInHistory)
        stackView.addArrangedSubview(macroViewQrCode)
        stackView.addArrangedSubview(macroViewAboutApp)
    }
    
    func setupConstraints() {
        let scrowViewHeight = scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        scrowViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            scrowViewHeight,
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - Layout.sideMenuRightPadding),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
}

extension SideMenuViewController: UIViewControllerTransitioningDelegate {

    private func openUserBottomSheet() {
        let viewController = MyAccountBottomSheet()
        viewController.tappedMyCardButton = { [weak self] in
            viewController.dismiss(animated: true)
            self?.coordinator?.goToMyCardViewController()
        }
        present(viewController, animated: true, completion: nil)
    }
}

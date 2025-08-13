//
//  HomeViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/12/21.
//

import UIKit

extension HomeViewController.Layout {

    static let bottomSheetHeight: CGFloat = 0.3

    enum CollectionSizes {
        static let cellsPerRow: CGFloat = 3
        static let spacingAreas: CGFloat = 1
        static let avaiableCollectionWidth = UIScreen.main.bounds.width - spacingAreas * 2
        static let cellWidth: CGFloat = floor((avaiableCollectionWidth / cellsPerRow))
        static let cellHeight = cellWidth
    }

    enum AlertTexts {
        static let title = "Avalie nosso App!"
        static let message = "Você nos ajuda demais, tanto mostrando que gostou do aplicativo, quanto deixando um feedback de algo que podemos melhorar."
        static let primaryButton = "Eu amei!"
        static let secondaryButton = "Não está satisfeito?\nComo podemos melhorar?"
    }

}

final class HomeViewController: BaseViewController, UIViewControllerTransitioningDelegate {
    // MARK: Properties
    var coordinator: HomeCoordinator?
    weak var delegate: HomeViewControllerDelegate?
    let viewModel: HomeViewModel
    enum Layout {}
    
    // MARK: Outlets
    @IBOutlet weak var viewOverlapBalance: UIView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelAccountCode: UILabel!
    @IBOutlet weak var collectionViewFeatures: UICollectionView!
    @IBOutlet weak var imageViewEye: UIImageView!
    @IBOutlet weak var labelCoins: UILabel!
    
    // MARK: Initialization
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeNavigationBar()
        setupUI()
        setupCollectionView()
        setupCollectionViewSize()
    }

    // MARK: Actions
    @IBAction func buttonShowBalance(_ sender: Any) {
        if viewOverlapBalance.alpha == 1 {
            viewOverlapBalance.fadeOut()
        } else {
            viewOverlapBalance.fadeIn()
        }
        imageViewEye.image = viewOverlapBalance.alpha == 1 ? UIImage(named: "cuttedEye") : UIImage(named: "Eye")
    }
    @IBAction func handleMyCardButton(_ sender: Any) {
        coordinator?.goToMyCardViewController()
    }
    
    @IBAction func handleCheckInHistoricButton(_ sender: Any) {
        coordinator?.goToCheckInHistoricViewController()
    }
    
    @IBAction func handleAboutAppButton(_ sender: Any) {
        coordinator?.goToAboutAppViewController()
    }
    
    // MARK: Methods
    private func setupUI() {
        imageViewEye.image = UIImage(named: "cuttedEye")
        viewOverlapBalance.layer.cornerRadius = 5
        let firstName = viewModel.getUserFirstName()
        let accountCode = viewModel.model.accountCode
        labelUserName.text = "Olá, \(firstName)"
        labelAccountCode.text = "Conta: \(accountCode)"
    }
    
    private func setupHomeNavigationBar() {
        let logo = UIImage(named: "logoSmall_usemobile")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = UIColor.primaryColor()
        self.navigationController?.navigationBar.backgroundColor = UIColor.primaryColor()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Sair",
                                                                      style: .done,
                                                                      target: self,
                                                                      action: #selector(self.logout(sender:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "list.dash"),
                                                                     style: .done,
                                                                     target: self,
                                                                     action: #selector(didTapMenuButton))
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.primaryColor()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.compactAppearance = appearance
            self.navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setupCollectionView() {
        collectionViewFeatures.delegate = self
        collectionViewFeatures.dataSource = self
        collectionViewFeatures.register(HomeCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    private func setupCollectionViewSize() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Layout.CollectionSizes.spacingAreas
        flowLayout.minimumLineSpacing = Layout.CollectionSizes.spacingAreas
        flowLayout.itemSize = .init(width: Layout.CollectionSizes.cellWidth,
                                    height: Layout.CollectionSizes.cellWidth)

        collectionViewFeatures.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    private func setupCollectionScrollPosition() {
        let index = IndexPath(item: 0, section: 0)
        collectionViewFeatures.scrollToItem(at: index, at: .right, animated: false)
    }
    
    @objc func logout(sender: UIBarButtonItem) {
        UserSessionManager.shared.logout()
        DispatchQueue.main.async {
            self.coordinator?.goToLoginIfHasNoSession()
        }
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }

    private func openErrorBottomSheet() {
        let viewController = ConnectionErrorBottomSheet()
        present(viewController, animated: true, completion: nil)
    }
    
    private func openCustomAlertWithRating() {
        let ratingView = StarRatingView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        let customAlert = CustomAlertViewController()
        customAlert.setTitleAlert(Layout.AlertTexts.title)
            .setMessage(Layout.AlertTexts.message)
            .setTitlePrimaryButton(Layout.AlertTexts.primaryButton)
            .setTitleSecondaryButton(Layout.AlertTexts.secondaryButton)
            .addCustomView(ratingView)
            .handlerButtonSecondary({ sender in
                sender.dismiss(animated: true, completion: nil)
            })
            .handlerButtonPrimary({ sender in
                sender.dismiss(animated: true, completion: nil)
            })
            .show(self)
    }
}

// MARK: Extensions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier,
                                                         for: indexPath) as? HomeCollectionViewCell {
            cell.setupCell(index: indexPath.item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 5 {
            self.openErrorBottomSheet()
        } else if indexPath.item == 1 {
            self.openCustomAlertWithRating()
        } else {
            let whiteApple = UIImage(named: "icon_apple")?.imageWithColor(color: .white)
            let featureIndex = indexPath.item.description
            let toast = Toast()
            toast.showSuccess("Sucesso!\nVocê clicou na feature \(featureIndex)", image: whiteApple)
        }
    }
}

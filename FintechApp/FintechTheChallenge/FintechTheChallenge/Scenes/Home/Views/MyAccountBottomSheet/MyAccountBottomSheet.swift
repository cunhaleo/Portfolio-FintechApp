//
//  MyAccountBottomSheet.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 22/09/22.
//

import UIKit

extension MyAccountBottomSheet.Texts {
    static let accountAndDevice = "\(UserSessionManager.shared.accountCode ?? "") | iOS"
    static let userPhrase = "Me inspiro na usemobile todos os dias no céu"
}

final class MyAccountBottomSheet: BottomSheetViewController {
    // MARK: Properties
    var tappedMyCardButton: (() -> Void)?
    enum Texts {}

    // MARK: Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonMyCard: UIButton!
    @IBOutlet weak var imageViewClient: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAccountAndDevice: UILabel!
    @IBOutlet weak var labelPhrase: UILabel!

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Methods
    private func setupUI() {
        contentView.layer.cornerRadius = 20
        buttonMyCard.layer.cornerRadius = 25
        imageViewClient.layer.cornerRadius = 79
        imageViewClient.image = UIImage.steveRounded()
        imageViewClient.contentMode = .center
        labelName.text = UserSessionManager.shared.userName
        labelName.font = UIFont.interFamily(.semiBold, size: 30)
        labelAccountAndDevice.text = Texts.accountAndDevice
        labelAccountAndDevice.font = UIFont.interFamily(.semiBold, size: 16)
        labelPhrase.text = Texts.userPhrase
        labelPhrase.font = UIFont.interFamily(.regular, size: 16)
        labelPhrase.textColor = .gray
        buttonMyCard.titleLabel?.font = UIFont.interFamily(.semiBold, size: 18)
    }

    // MARK: Actions
    @IBAction func handleMyCardButton(_ sender: Any) {
        tappedMyCardButton?()
    }
}

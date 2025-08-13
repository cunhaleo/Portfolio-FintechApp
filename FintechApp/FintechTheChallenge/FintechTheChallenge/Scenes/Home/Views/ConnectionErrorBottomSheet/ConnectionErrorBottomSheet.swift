//
//  HomeBottomSheetViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 17/03/22.
//

import UIKit

class ConnectionErrorBottomSheet: BottomSheetViewController {
    // MARK: Outlets
    @IBOutlet weak var buttonRetry: UIButton!
    @IBOutlet weak var contentView: UIView!

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setups
    private func setupUI() {
        buttonRetry.layer.cornerRadius = 25
        contentView.layer.cornerRadius = 20
    }

    // MARK: Actions
    @IBAction func handleRetryButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

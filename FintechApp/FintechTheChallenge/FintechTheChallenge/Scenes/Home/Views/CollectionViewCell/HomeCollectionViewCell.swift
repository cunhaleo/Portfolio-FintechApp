//
//  HomeCollectionViewCell.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/02/22.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    // MARK: Properties
    static var identifier = "HomeCollectionViewCell"
    static var nib = UINib(nibName: identifier, bundle: nil)

    // MARK: Outlets
    @IBOutlet weak var labelFeature: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: Methods
    func setupCell(index: Int?) {
        guard let index = index else { return }
        labelFeature.text = "FEATURE \(String(describing: index))"
    }
}

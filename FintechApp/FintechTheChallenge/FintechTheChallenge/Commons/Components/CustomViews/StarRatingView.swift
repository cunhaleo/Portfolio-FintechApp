//
//  StarRatingView.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 03/06/22.
//

import UIKit

class StarRatingView: UIView {
    // MARK: Properties
    let viewName = "StarRatingView"
    
    // MARK: Outlets
    @IBOutlet var contentView: StarRatingView!
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(viewName, owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
    }
}

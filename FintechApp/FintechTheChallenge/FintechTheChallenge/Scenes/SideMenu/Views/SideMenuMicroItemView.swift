//
//  SideMenuMicroItemView.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 27/07/22.
//

import UIKit

final class SideMenuMicroItemView: UIView {
    
    var descriptionText: String? {
        didSet {
            labelDescription.text = descriptionText
        }
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.primaryColor()
        return view
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.interFamily(.medium, size: 20)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    var didPressItem: (() -> Void)?
    
    private lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
    
    @objc func tapAction() {
        didPressItem?()
    }
}

extension SideMenuMicroItemView: ViewConfiguration {
    func setupHierarchy() {
        addSubview(contentView)
        contentView.addSubview(labelDescription)
        contentView.addGestureRecognizer(gesture)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 40),
            
            labelDescription.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24)
        ])
        
    }
}

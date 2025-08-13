//
//  SideMenuUserView.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 22/07/22.
//

import UIKit

final class SideMenuUserView: UIView {
    
    var username: String? {
        didSet {
            labelFirstLine.text = username
        }
    }
    
    var account: String? {
        didSet {
            labelSecondLine.text = "Conta: \(account ?? "")"
        }
    }
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.secondaryColor()
       return contentView
    }()
    
    private lazy var imageViewLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageViewRight: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelFirstLine: UILabel = {
        let labelFirstLine = UILabel()
        labelFirstLine.translatesAutoresizingMaskIntoConstraints = false
        labelFirstLine.textColor = .white
        labelFirstLine.font = UIFont.interFamily(.semiBold, size: 18)
        return labelFirstLine
    }()
    
    private lazy var labelSecondLine: UILabel = {
        let labelSecondLine = UILabel()
        labelSecondLine.translatesAutoresizingMaskIntoConstraints = false
        labelSecondLine.textColor = .white
        labelSecondLine.font = UIFont.interFamily(.semiBold, size: 15)
        return labelSecondLine
    }()
    
    func addLeftImage(_ image: UIImage) {
        imageViewLeft.image = image
    }
    
    init() {
        super.init(frame: .zero)
        buildLayout()
        addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var didPressUserView: (() -> Void)?

    private lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))

    @objc func tapAction() {
        didPressUserView?()
    }
}

extension SideMenuUserView: ViewConfiguration {
    func setupHierarchy() {
        addSubview(contentView)
        contentView.addSubview(imageViewLeft)
        contentView.addSubview(imageViewRight)
        contentView.addSubview(labelFirstLine)
        contentView.addSubview(labelSecondLine)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 70),
            
            labelFirstLine.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            labelFirstLine.leftAnchor.constraint(equalTo: imageViewLeft.rightAnchor, constant: 16),
            labelFirstLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            
            labelSecondLine.topAnchor.constraint(equalTo: labelFirstLine.bottomAnchor),
            labelSecondLine.leftAnchor.constraint(equalTo: imageViewLeft.rightAnchor, constant: 16),
            labelSecondLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            
            imageViewLeft.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            imageViewLeft.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            imageViewLeft.widthAnchor.constraint(equalToConstant: 35),
            imageViewLeft.heightAnchor.constraint(equalToConstant: 40),
            
            imageViewRight.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
            imageViewRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViewRight.widthAnchor.constraint(equalToConstant: 14),
            imageViewRight.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}

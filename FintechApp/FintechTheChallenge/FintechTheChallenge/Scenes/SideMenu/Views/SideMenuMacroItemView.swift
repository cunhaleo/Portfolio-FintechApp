//
//  SideMenuMacroItemView.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 22/07/22.
//

import UIKit

final class SideMenuMacroItemView: UIView {
    enum ItemState {
        case expanded
        case contracted
        case single
    }
    
    var itemState: ItemState = .single {
        didSet {
            switch itemState {
            case .single:
                imageViewRight.image = nil
            case .contracted:
                imageViewRight.image = UIImage(systemName: "plus")?.imageWithColor(color: UIColor.darkGray)
                UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews) { [weak self] in
                    self?.microItems?.forEach({ microItem in
                        microItem.isHidden = true
                    })
                    self?.stackView.layoutIfNeeded()
                }
                
            case .expanded:
                imageViewRight.image = UIImage(systemName: "minus")?.imageWithColor(color: UIColor.darkGray)
                UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews) { [weak self] in
                    self?.microItems?.forEach({ microItem in
                        microItem.isHidden = false
                    })
                    self?.stackView.layoutIfNeeded()
                }
            }
        }
    }
    
    var microItems: [SideMenuMicroItemView]? {
        didSet {
            itemState = microItems != nil ? .expanded : .single
            microItems?.forEach({ microItemView in
                stackView.addArrangedSubview(microItemView)
            })
        }
    }
    
    var descriptionText: String? {
        didSet {
            labelDescription.text = descriptionText
        }
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var macroItemView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var labelDescription: UILabel = {
        let labelFirstLine = UILabel()
        labelFirstLine.translatesAutoresizingMaskIntoConstraints = false
        labelFirstLine.font = UIFont.interFamily(.medium, size: 19)
        labelFirstLine.textColor = UIColor.darkGray
        return labelFirstLine
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.backgroundColor = UIColor.darkGray
        return stackView
    }()
    
    func addLeftImage(_ image: UIImage) {
        imageViewLeft.image = image
    }
    
    init() {
        super.init(frame: .zero)
        buildLayout()
        macroItemView.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    var didPressSingleItem: (() -> Void)?
    private lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
    
    @objc func tapAction() {
        switch itemState {
        case .single:
            didPressSingleItem?()
        case .contracted:
            itemState = .expanded
        case .expanded:
            itemState = .contracted
        }
    }
}

extension SideMenuMacroItemView: ViewConfiguration {
    func setupHierarchy() {
        addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(macroItemView)
        macroItemView.addSubview(imageViewLeft)
        macroItemView.addSubview(imageViewRight)
        macroItemView.addSubview(labelDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            macroItemView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            macroItemView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            macroItemView.heightAnchor.constraint(equalToConstant: 70),
            
            imageViewLeft.centerYAnchor.constraint(equalTo: macroItemView.centerYAnchor),
            imageViewLeft.leftAnchor.constraint(equalTo: macroItemView.leftAnchor, constant: 20),
            imageViewLeft.widthAnchor.constraint(equalToConstant: 26),
            imageViewLeft.heightAnchor.constraint(equalToConstant: 30),
            
            labelDescription.centerYAnchor.constraint(equalTo: macroItemView.centerYAnchor),
            labelDescription.leftAnchor.constraint(equalTo: imageViewLeft.rightAnchor, constant: 16),
            labelDescription.rightAnchor.constraint(equalTo: imageViewRight.leftAnchor, constant: 10),
            
            imageViewRight.rightAnchor.constraint(equalTo: macroItemView.rightAnchor, constant: -22),
            imageViewRight.centerYAnchor.constraint(equalTo: macroItemView.centerYAnchor),
            imageViewRight.widthAnchor.constraint(equalToConstant: 14),
            imageViewRight.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
}

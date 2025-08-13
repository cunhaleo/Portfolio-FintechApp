//
//  MenuHeaderView.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 22/07/22.
//

import UIKit

final class SideMenuHeaderView: UIView {
    
    var title: String? {
        didSet {
            reloadData()
        }
    }
    var topDescription: String? {
        didSet {
            reloadData()
        }
    }
    
    init() {
        super.init(frame: .zero)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: Methods
    private func reloadData() {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        
        let labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.interFamily(.regular, size: 22)
        labelTitle.textColor = .white
        labelTitle.text = title
        
        let labelDescription = UILabel()
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.textAlignment = .center
        labelDescription.font = UIFont.interFamily(.semiBold, size: 33)
        labelDescription.textColor = .white
        labelDescription.text = topDescription
        
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelDescription)
    }
}

extension SideMenuHeaderView: ViewConfiguration {
    func setupHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.heightAnchor.constraint(equalToConstant: 162)
        ])
    }
}

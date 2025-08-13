//
//  ToastView.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 26/05/22.
//

import UIKit

final class ToastView: UIView {
    // MARK: Properties
    private let label = UILabel()
    private var imageView = UIImageView()
    private let padding: CGFloat = 15
    private let screenPadding: CGFloat = 5
    
    // MARK: Initializers
    public required init(with message: String,
                         image: UIImage?,
                         color: UIColor?) {
        super.init(frame: .zero)
        setup(message: message, image: image, with: color)
    }
    
    public required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Overrides
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        centerView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        centerView()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        let constraintWidth = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .lessThanOrEqual,
            toItem: nil,
            attribute: .width,
            multiplier: 1.0,
            constant: UIScreen.main.bounds.width - 2 * screenPadding)
        constraintWidth.priority = .init(1000)
        constraintWidth.isActive = true
    }
    
    // MARK: Setups
    private func setup(message: String,
                       image: UIImage?,
                       with color: UIColor?) {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 8
        backgroundColor = color
        setupImage(with: image)
        setupLabel(with: message)
        setupConstraints()
    }
    
    private func setupImage(with image: UIImage?) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
    }
    
    private func setupLabel(with message: String) {
        label.text = message
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 8
        addSubview(label)
    }
    
    private func setupConstraints() {
        addConstraints([imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
                        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
                        imageView.widthAnchor.constraint(equalToConstant: 35),
                        imageView.heightAnchor.constraint(equalToConstant: 35),
                        label.topAnchor.constraint(equalTo: topAnchor, constant: padding),
                        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
                        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
                        label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12)])
    }
    
    // MARK: Methods
    private func centerView() {
        if let superview = superview {
            center.x = superview.frame.size.width / 2
        }
    }
    
    func getScreenPadding() -> CGFloat {
        screenPadding
    }
}

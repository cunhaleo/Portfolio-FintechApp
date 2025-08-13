//
//  ProgressViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/12/21.
//

import UIKit
import Lottie

final class ProgressViewController: UIViewController {
    // MARK: Properties
    let animationView = AnimationView()
    
    // MARK: Outlets
    @IBOutlet weak var uiView: UIView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    // MARK: Methods
    private func setupAnimation() {
        animationView.animation = Animation.named("loading")
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            animationView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            animationView.topAnchor.constraint(equalTo: self.view.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

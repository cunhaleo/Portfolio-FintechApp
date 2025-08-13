//
//  BottomSheetViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 17/03/22.
//

import UIKit

class BottomSheetViewController: UIViewController {
    // MARK: Properties
    private var pointOrigin: CGPoint?
    private var hasSetPointOrigin = false

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    // MARK: Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        setupBackgroundViews()
        addPanGestureRecognizer()
        addTapGestureRecognizer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        fadeOutBackground()
    }

    override func viewWillAppear(_ animated: Bool) {
        fadeInBackground()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = view.frame.origin
        }
    }
    
    // MARK: Methods
    private func fadeInBackground() {
        self.backgroundView.alpha = 0
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.backgroundView.alpha = 0.6
        }
    }

    private func fadeOutBackground() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.backgroundView.alpha = 0
        }
    }
    
    private func addPanGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(panGestureAction))
        view.addGestureRecognizer(panGesture)
    }

    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(tapGestureAction))
        backgroundView.addGestureRecognizer(tapGesture)
    }

    private func setupBackgroundViews() {
        self.view.backgroundColor = .clear
    }

    // MARK: Actions
    @objc
    private func tapGestureAction(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }

    @objc
    private func panGestureAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard translation.y >= 0, let pointOrigin = pointOrigin else { return }
        view.frame.origin = CGPoint(x: 0, y: pointOrigin.y + translation.y)
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.view.frame.origin = self?.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}

extension BottomSheetViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -UIScreen.main.bounds.height)
        ])
    }
}

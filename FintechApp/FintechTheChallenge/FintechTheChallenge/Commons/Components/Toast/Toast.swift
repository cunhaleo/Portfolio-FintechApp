//
//  Toast.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 26/05/22.
//

import UIKit

class Toast {
    // MARK: Specific Success Methods - Testable Spy Methods
    open func showToastSuggestion() {
        let image = UIImage(named: "circle-with-check")?.imageWithColor(color: .white)
        showSuccess("Sucesso! Sua sugestão foi enviada!", image: image)
    }
    
    // MARK: Specific Error Methods - Testable Spy Methods
    open func showNetworkError() {
        let image = UIImage(named: "image-network-error")?.imageWithColor(color: .white)
        showError("Ops... Ocorreu um problema!\nVerfique a conexão com a rede.", image: image)
    }
    
    open func showProcessingError() {
        let image = UIImage(named: "image-processing-error")?.imageWithColor(color: .white)
        showError("Ops... Ocorreu um problema!\nTente novamente mais tarde.", image: image)
    }
    
    // MARK: Generic Toast Methods - Not Testable Spy Methods
    open func showSuccess(_ message: String, image: UIImage? = nil) {
        show(message: message, withImage: image, backgroundColor: UIColor.secondaryColor())
    }
    
    private func showError(_ message: String, image: UIImage? = nil) {
        show(message: message, withImage: image, backgroundColor: .red)
    }
    
    // MARK: Base of Toast
    private func show(message: String,
                      withImage image: UIImage? = nil,
                      backgroundColor: UIColor?) {
        let toastView = ToastView(with: message, image: image, color: backgroundColor)
        let toastContainer = setupToastContainer(with: toastView)
        handlePresentationAnimations(of: toastContainer, paddingTop: getPaddingTop(of: toastView))
    }
    
    private func setupToastContainer(with toastView: ToastView) -> UIView? {
        guard let keyWindow = UIApplication.shared.keyWindow else { return nil }
        let toastContainer = UIView(frame: UIScreen.main.bounds)
        toastContainer.isUserInteractionEnabled = false
        toastContainer.addSubview(toastView)
        keyWindow.addSubview(toastContainer)
        return toastContainer
    }
    
    private func getPaddingTop(of toastView: ToastView) -> CGFloat {
        var paddingTop: CGFloat = toastView.getScreenPadding()
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width {
            paddingTop += UIApplication.shared.statusBarFrame.height
        }
        return paddingTop
    }
    
    private func handlePresentationAnimations(of toastContainer: UIView?,
                                              paddingTop: CGFloat,
                                              visibilityDuration: TimeInterval = 3) {
        toastContainer?.frame.origin.y = -UIScreen.main.bounds.height / 2
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        toastContainer?.frame.origin.y = paddingTop
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + visibilityDuration, execute: {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    toastContainer?.frame.origin.y = -UIScreen.main.bounds.height / 2
                }, completion: { _ in
                    toastContainer?.removeFromSuperview()
                })
            })
        })
    }
}

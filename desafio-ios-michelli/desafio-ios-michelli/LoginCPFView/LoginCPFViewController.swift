//
//  LoginCPFViewController.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

class LoginCPFViewController: UIViewController {

    var loginCPFView: LoginCPFView?

    override func loadView() {
        loginCPFView = LoginCPFView()
        self.view = loginCPFView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSetup()
        loginCPFView?.delegate = self
    }

    func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}

extension LoginCPFViewController {
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let view = loginCPFView, let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = view.frame.height - (view.nextButton.frame.origin.y + view.nextButton.frame.height)
            view.nextButton.frame.origin.y -= keyboardHeight - bottomSpace + 16
        }
    }

    @objc private func keyboardWillHide() {
        if let view = loginCPFView {
            view.nextButton.frame.origin.y = view.frame.height + (-66)
        }
    }

}

extension LoginCPFViewController: LoginCPFViewDelegate {

    func nextButton() {
        let vc = LoginPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

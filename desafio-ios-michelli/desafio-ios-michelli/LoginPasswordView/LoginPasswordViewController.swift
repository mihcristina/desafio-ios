//
//  LoginPasswordViewController.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

class LoginPasswordViewController: UIViewController {

    var loginPasswordView: LoginPasswordView?

    override func loadView() {
        loginPasswordView = LoginPasswordView()
        self.view = loginPasswordView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSetup()
        loginPasswordView?.delegate = self
    }

    func keyboardSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}

extension LoginPasswordViewController {
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let view = loginPasswordView, let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = view.frame.height - (view.nextButton.frame.origin.y + view.nextButton.frame.height)
            view.nextButton.frame.origin.y -= keyboardHeight - bottomSpace + 16
        }
    }

    @objc private func keyboardWillHide() {
        if let view = loginPasswordView {
            view.nextButton.frame.origin.y = view.frame.height + (-66)
        }
    }

}

extension LoginPasswordViewController: LoginPasswordViewDelegate {

    func nextButton() {
        
    }

}


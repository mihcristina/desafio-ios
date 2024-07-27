//
//  LoginPasswordView.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

protocol LoginPasswordViewDelegate: AnyObject {
    func nextButton()
}

class LoginPasswordView: UIView {

    weak var delegate: LoginPasswordViewDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite sua senha de acesso"
        label.font = UIFont.customFont(type: .black, size: 22)
        label.textColor = UIColor.darkLabel
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite aqui sua senha"
        textField.font = UIFont.customFont(type: .book, size: 22)
        textField.textColor = UIColor.darkLabel
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        return textField
    }()

    private lazy var forgotMyPasswordButton: TertiaryButton = {
        let button = TertiaryButton(title: "Esqueci minha senha", foregroundColor: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var nextButton: PrimaryButton = {
        let button = PrimaryButton(title: "Próximo", foregroundColor: .white, backgColor: .primary, enumIcon: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextLoginButton)))
        return button
    }()

    @objc private func nextLoginButton() {
        delegate?.nextButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LoginPasswordView: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(passwordTextField)
        addSubview(forgotMyPasswordButton)
        addSubview(nextButton)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            passwordTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 32),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),

            forgotMyPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 48),
            forgotMyPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    func configure() {
        backgroundColor = .white
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }

}

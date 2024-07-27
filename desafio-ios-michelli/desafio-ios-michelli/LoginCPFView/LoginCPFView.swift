//
//  LoginCPFView.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

protocol LoginCPFViewDelegate: AnyObject {
    func nextButton()
}

class LoginCPFView: UIView {

    weak var delegate: LoginCPFViewDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem vindo de volta!"
        label.font = UIFont.customFont(type: .book, size: 16)
        label.textColor = UIColor.welcomeBackColor
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Qual seu CPF?"
        label.font = UIFont.customFont(type: .black, size: 22)
        label.textColor = UIColor.darkLabel
        return label
    }()

    private lazy var cpfTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite aqui seu CPF"
        textField.font = UIFont.customFont(type: .book, size: 22)
        textField.textColor = UIColor.darkLabel
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .no
        return textField
    }()

    lazy var nextButton: PrimaryButton = {
        let button = PrimaryButton(title: "Próximo", foregroundColor: .white, backgColor: .primary, enumIcon: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextLogiButton), for: .touchUpInside)
        return button
    }()

    @objc private func nextLogiButton() {
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

extension LoginCPFView: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(cpfTextField)
        addSubview(nextButton)
    }
    
    func buildConstraints() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            cpfTextField.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 32),
            cpfTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            cpfTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),

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

    @objc private func hideKeyboard() {
        self.endEditing(true)
    }

}

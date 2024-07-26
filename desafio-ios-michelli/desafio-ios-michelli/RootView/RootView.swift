//
//  RootView.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 25/07/24.
//

import UIKit

class RootView: UIView {

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .primary
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        image.layer.cornerRadius = 210
        return image
    }()

    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Complete")
        image.contentMode = .scaleToFill
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conta Digital PJ"
        label.font = UIFont.customFont(type: .black, size: 28)
        label.textColor = .white
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Poderosamente simples"
        label.font = UIFont.customFont(type: .book, size: 28)
        label.textColor = .white
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sua empresa livre burocracias e de taxas para\ngerar boletos, fazer transferências e\npagamentos."
        label.font = UIFont.customFont(type: .roman, size: 16)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    private lazy var loginButton: PrimaryButton = {
        let button = PrimaryButton(title: "Quero fazer parte!", foregroundColor: .primary, backgColor: .white, enumIcon: .pink)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var secondaryButton: SecondaryButton = {
        let button = SecondaryButton(title: "Já sou cliente", foregroundColor: .white, backgColor: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RootView: ViewCodable {
    func buildHierarchy() {
        addSubview(backgroundView)
        backgroundView.addSubview(backgroundImage)
        backgroundImage.addSubview(logoImage)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(subtitleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(loginButton)
        backgroundView.addSubview(secondaryButton)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            backgroundImage.topAnchor.constraint(equalTo: self.backgroundView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            backgroundImage.heightAnchor.constraint(equalToConstant: 490),
            
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 44),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            backgroundImage.widthAnchor.constraint(equalToConstant: 90),

            titleLabel.topAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            descriptionLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),

            loginButton.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 64),
            
            secondaryButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 16),
            secondaryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            secondaryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            secondaryButton.heightAnchor.constraint(equalToConstant: 64),

        ])
    }

}

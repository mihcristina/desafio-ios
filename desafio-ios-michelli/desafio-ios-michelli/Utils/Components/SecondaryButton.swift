//
//  SecondaryButton.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

class SecondaryButton: UIControl {

    var title: String
    var foregroundColor: UIColor
    var backgColor: UIColor

    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.title
        label.textColor = self.foregroundColor
        label.font = UIFont.customFont(type: .book, size: 16)
        return label
    }()

    init(title: String, foregroundColor: UIColor, backgColor: UIColor) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgColor = backgColor
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SecondaryButton: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }

    func configure() {
        self.backgroundColor = self.backgColor
    }

}

//
//  TertiaryButton.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 27/07/24.
//

import UIKit

class TertiaryButton: UIControl {

    var title: String
    var foregroundColor: UIColor

    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.title
        label.textColor = self.foregroundColor
        label.font = UIFont.customFont(type: .book, size: 14)
        return label
    }()
    init(title: String, foregroundColor: UIColor) {
        self.title = title
        self.foregroundColor = foregroundColor
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TertiaryButton: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }

}

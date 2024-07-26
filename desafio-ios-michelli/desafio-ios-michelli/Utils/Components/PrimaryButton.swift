//
//  PrimaryButton.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

enum IconCustomButton: String {
    case white = "icon-white"
    case pink = "icon-pink"
}

class PrimaryButton: UIControl {

    var title: String
    var foregroundColor: UIColor
    var backgColor: UIColor
    var enumIcon: IconCustomButton?

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = self.backgColor
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.title
        label.textColor = self.foregroundColor
        label.font = UIFont.customFont(type: .book, size: 16)
        return label
    }()

    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: self.enumIcon?.rawValue ?? "")
        return image
    }()

    init(title: String, foregroundColor: UIColor, backgColor: UIColor, enumIcon: IconCustomButton) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgColor = backgColor
        self.enumIcon = enumIcon
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PrimaryButton: ViewCodable {
    func buildHierarchy() {
        addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(iconImage)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

        ])
    }

}

//
//  RootView.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 25/07/24.
//

import UIKit

class RootView: UIView {

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(backgroundImage)
        addSubview(backgroundView)
    }
    
    func buildConstraints() {
        
    }

}

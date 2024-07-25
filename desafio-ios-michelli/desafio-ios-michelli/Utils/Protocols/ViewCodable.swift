//
//  ViewCodable.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 25/07/24.
//

import Foundation

public protocol ViewCodable {
    func configure()
    func buildHierarchy()
    func buildConstraints()
    func setupView()
}

public extension ViewCodable {

    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
    }

    func configure() {}
    
}

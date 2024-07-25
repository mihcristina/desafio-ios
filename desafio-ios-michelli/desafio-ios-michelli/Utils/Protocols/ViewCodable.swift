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
    func render()
    func setupView()
}

public extension ViewCodable {

    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
        render()
    }

    func configure() {}
    
}

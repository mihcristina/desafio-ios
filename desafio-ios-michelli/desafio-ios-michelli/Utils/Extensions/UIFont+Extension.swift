//
//  UIFont+Extension.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

extension UIFont {

    enum FontType {
        case black
        case book
        case roman

        func getFontName() -> String {
            switch self {
            case .black:
                return "AvenirLTStd-Black"
            case .book:
                return "AvenirLTStd-Book"
            case .roman:
                return "AvenirLTStd-Roman"
            }
        }
    }

    static func customFont(type: FontType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }

}

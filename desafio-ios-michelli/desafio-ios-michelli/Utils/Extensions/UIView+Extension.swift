//
//  UIView+Extension.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 26/07/24.
//

import UIKit

extension UIView {
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
}

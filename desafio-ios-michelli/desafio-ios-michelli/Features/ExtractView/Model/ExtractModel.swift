//
//  ExtractModel.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 27/07/24.
//

import UIKit

struct Extract: Codable {
    var results: [Items]
    var date: String
    var itemsTotal: Int
}

struct Items: Codable {
    var id: String
    var description: String
    var label: String
    var entry: String
    var amount: Int
    var name: String
    var dateEvent: String
    var status: String
}

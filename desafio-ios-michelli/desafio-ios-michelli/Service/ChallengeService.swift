//
//  ChallengeService.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 27/07/24.
//

import Foundation

enum ChallengeService {
    case login
    case list
    case detail
}

extension ChallengeService: Route {
    
    var baseURL: URL {
        URL(string: "https://api.challenge.stage.cora.com.br/challenge")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth"
        case .list:
            return "/list"
        case .detail:
            return "/detail/:{id}"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .POST
        case .list, .detail:
            return .GET
        }
    }
    var header: [String : String] {
        switch self {
        case .login:
            return ["apikey":"f97ef9fa6bd44b2d9aeed7fea5c8e13f"]
        case .list:
            return [
                "apikey":"f97ef9fa6bd44b2d9aeed7fea5c8e13f",
                "token":"{TOKEN}"
            ]
        case .detail:
            return [
                "apikey":"f97ef9fa6bd44b2d9aeed7fea5c8e13f",
                "token":"{TOKEN}"
            ]
        }
    }

}

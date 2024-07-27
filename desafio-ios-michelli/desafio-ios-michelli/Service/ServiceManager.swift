//
//  ServiceManager.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 27/07/24.
//

import Foundation

enum Method: String {
    case POST, GET, DELETE, PUT
}

protocol Route {
    var baseURL: URL { get }
    var path: String { get }
    var method: Method { get }
    var header: [String: String] { get }
}

protocol ServiceProtocol {
    func getInfos<T: Decodable>(route: Route, type: T.Type, callback: @escaping (Result<T,Error>) -> Void)
}

class Service: ServiceProtocol {
    
    private let urlSession: URLSession
    
    init(
        urlSession: URLSession = .shared
    ) {
        self.urlSession = urlSession
    }
    
    func getInfos<T: Decodable>(route: Route, type: T.Type = T.self, callback: @escaping (Result<T, Error>) -> Void) {
        switch route.method {
        case .GET:
            get(route: route, callback: callback)
        default:
            break
        }
    }
    
    func postInfos<T: Decodable>(route: Route, type: T.Type = T.self, callback: @escaping (Result<T, Error>) -> Void) {
        switch route.method {
        case .POST:
            post(route: route, callback: callback)
        default:
            break
        }
    }

    private func post<T: Decodable>(route: Route, callback: @escaping (Result<T, Error>) -> Void) {
        let url = route.baseURL
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        let header = route.header
       // let data = try encoder.encode(message)
       // request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS")
            } else {
                print("FAILURE")
            }
        }
        task.resume()
    }
    
    private func get<T: Decodable>(route: Route, callback: @escaping (Result<T, Error>) -> Void) {
        var url = route.baseURL
        url.append(path: route.path)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = urlSession.dataTask(with: request) { data, responde, error in
            if let error {
                callback(.failure(error))
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(T.self, from: data)
                        callback(.success(json))
                    } catch (let err) {
                        callback(.failure(err))
                    }
                }
            }
        }
        task.resume()
    }

}

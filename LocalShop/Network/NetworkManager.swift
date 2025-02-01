//
//  NetworkManager.swift
//  LocalShop
//
//  Created by talha.sahin on 29.02.2024.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add more HTTP methods as needed
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData
}

struct APIRequest<T: Codable> {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    public func buildURL(endpoint: String) -> URL {
        return URL(string: APIS.baseApiUrl + endpoint)!
    }

    private func buildRequest<T: Codable>(for apiRequest: APIRequest<T>) -> URLRequest {
        var request = URLRequest(url: apiRequest.url)
        request.httpMethod = apiRequest.method.rawValue
        request.allHTTPHeaderFields = apiRequest.headers
        request.httpBody = apiRequest.body
        return request
    }

    func sendRequest<T: Codable>(for apiRequest: APIRequest<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let request = buildRequest(for: apiRequest)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}

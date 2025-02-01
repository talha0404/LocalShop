//
//  APIEndpoint.swift
//  LocalShop
//
//  Created by talha.sahin on 29.02.2024.
//

import Foundation

enum APIEndpoint {
    case products
    case productsByCategory(Category)

    var url: String {
        let baseURL = "https://fakestoreapi.com/products"
        switch self {
        case .products:
            return baseURL
        case .productsByCategory(let category):
            return "\(baseURL)/category/\(category)"
        }
    }
}

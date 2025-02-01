//
//  HomeViewModel.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?    

    func loadProducts() {
        let postRequest = APIRequest<Product>(url: NetworkManager.shared.buildURL(endpoint: "/products"),
                                     method: .get,
                                     headers: nil,
                                     body: nil)

        // Send the API request
        NetworkManager.shared.sendRequest(for: postRequest) { (result: Result<Product, NetworkError>) in
            switch result {
            case .success(let post):
                self.delegate?.reloadData(product: post)
            case .failure(let error): break
            }
        }
    }
}

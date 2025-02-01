//
//  HomeContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    func loadProducts()
}

protocol HomeViewModelDelegate: AnyObject {
    func reloadData(product: Product)
}

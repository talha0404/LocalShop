//
//  BasketContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation


protocol BasketViewModelProtocol {
    var delegate: BasketViewModelDelegate? { get set }
}

protocol BasketViewModelDelegate: AnyObject { 
    func reloadData()
}

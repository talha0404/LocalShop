//
//  FavoriteContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

protocol FavoriteViewModelProtocol {
    var delegate: FavoriteViewModelDelegate? { get set }
}

protocol FavoriteViewModelDelegate: AnyObject {

}

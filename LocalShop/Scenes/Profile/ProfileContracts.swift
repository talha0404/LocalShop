//
//  ProfileContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
}

protocol ProfileViewModelDelegate: AnyObject {

}

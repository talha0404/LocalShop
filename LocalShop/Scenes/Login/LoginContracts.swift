//
//  LoginContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 19.05.2024.
//

import Foundation

protocol LoginViewModelProtocol {

    // MVVM modelimizde login sayfasını kurarken instance oluşturmamız gerekiyor. Biz bunu class yerine protocol üzerinden yapacağız
    // Dataların sonucunu delegate'i controllerımıza bağlayacağız.

    var delegate: LoginViewModelDelegate? { get set }

    func login()
    func updateUsername(_ username: String?)
    func updatePassword(_ password: String?)
}

protocol LoginViewModelDelegate: AnyObject {
    // Delegate'imizi viewController'a bağlamak için obje haline getiriyoruz.

    func didUpdateLoginStatus(_ viewModel: LoginViewModel, isSuccess: Bool, message: String)
}

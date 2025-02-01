//
//  LoginViewModel.swift
//  LocalShop
//
//  Created by talha.sahin on 19.05.2024.
//

import Foundation

struct User {
    var username: String
    var password: String
}

final class LoginViewModel: LoginViewModelProtocol {
    private var user = User(username: "", password: "")

    var delegate: LoginViewModelDelegate?

    func login() {
        guard !user.username.isEmpty, !user.password.isEmpty else {
            delegate?.didUpdateLoginStatus(self, isSuccess: false, message: "Username or Password should not be empty")
            return
        }
      
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if self.user.username == "admin" && self.user.password == "password" {
                    self.delegate?.didUpdateLoginStatus(self, isSuccess: true, message: "Login successful")
                } else {
                    self.delegate?.didUpdateLoginStatus(self, isSuccess: false, message: "Invalid credentials")
                }
            }
        }
    }

    func updateUsername(_ username: String?) {
        user.username = username ?? ""
    }

    func updatePassword(_ password: String?) {
        user.password = password ?? ""
    }
}

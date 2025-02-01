//
//  LoginViewController.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModelProtocol? = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        setupUI()
        configureUI()
    }

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()


    private func setupUI() {
           view.addSubview(activityIndicator)
           activityIndicator.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
       }

    private func startLoading() {
        activityIndicator.startAnimating()
        btnLogin.isEnabled = false
        usernameTextField.isEnabled = false
        passwordTextField.isEnabled = false
    }

    private func stopLoading() {
        activityIndicator.stopAnimating()
        btnLogin.isEnabled = true
        usernameTextField.isEnabled = true
        passwordTextField.isEnabled = true
    }

    private func configureUI() {
        // Do any additional setup after loading the view.
        btnLogin.backgroundColor = UIColor(hex: "#73f071")
    }

    @IBAction func loginClicked(_ sender: Any) {
        viewModel?.updateUsername(usernameTextField.text)
        viewModel?.updatePassword(passwordTextField.text)
        startLoading()
        viewModel?.login()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didUpdateLoginStatus(_ viewModel: LoginViewModel, isSuccess: Bool, message: String) {
        stopLoading()
        if isSuccess {
            let controller = TabPageBuilder.build()
            present(controller, animated: true, completion: nil)
        } else {
            print("<<< Failed")
        }

    }
}

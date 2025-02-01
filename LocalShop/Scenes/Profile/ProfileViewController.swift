//
//  ProfileViewController.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    var vm: ProfileViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProfileViewController: ProfileViewModelDelegate { }

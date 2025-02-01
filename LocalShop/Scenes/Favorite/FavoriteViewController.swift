//
//  FavoriteViewController.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import UIKit

class FavoriteViewController: UIViewController {

    var vm: FavoriteViewModelProtocol?

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

extension FavoriteViewController: FavoriteViewModelDelegate { }

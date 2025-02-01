//
//  FavoriteBuilder.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation
import UIKit

struct FavoriteBuilder {
    static func build() -> UINavigationController {
        let favoriteViewStoryboard = UIStoryboard(name: "FavoriteView", bundle: nil)
        let favoriteVC = favoriteViewStoryboard.instantiateViewController(withIdentifier: "FavoriteView") as! FavoriteViewController
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        favoriteNC.tabBarItem.image = UIImage(systemName: "heart.fill")
        favoriteVC.title = "Favorite"

        let vm = FavoriteViewModel()
        vm.delegate = favoriteVC
        favoriteVC.vm = vm

        return favoriteNC
    }
}

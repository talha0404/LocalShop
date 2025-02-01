//
//  HomeBuilder.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

import UIKit

struct HomeBuilder {
    static func build() -> UINavigationController {
        let homeViewStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeNC.tabBarItem.image = UIImage(systemName: "house.fill")
        homeVC.title = "Home"

        let vm = HomeViewModel()
        vm.delegate = homeVC
        homeVC.vm = vm

        return homeNC
    }
}

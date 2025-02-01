//
//  BasketBuilder.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation

import UIKit

struct BasketBuilder {
    static func build() -> UINavigationController {
        let basketViewStoryboard = UIStoryboard(name: "BasketView", bundle: nil)
        let basketVC = basketViewStoryboard.instantiateViewController(withIdentifier: "BasketView") as! BasketViewController
        let basketNC = UINavigationController(rootViewController: basketVC)
        basketNC.tabBarItem.image = UIImage(systemName: "basket.fill")
        basketVC.title = "Basket"

        let vm = BasketViewModel()
        vm.delegate = basketVC
        basketVC.vm = vm

        return basketNC
    }
}

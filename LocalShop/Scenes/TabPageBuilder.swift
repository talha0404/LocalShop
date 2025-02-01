//
//  TabBarBuilder.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation
import UIKit

class TabPageBuilder {
    static func build() -> UITabBarController {
        let controller = UITabBarController()

        let homeNavigationController = HomeBuilder.build()
        let basketNavigationController = BasketBuilder.build()
        let favoriteNavigationController = FavoriteBuilder.build()
        let profileNavigationController = ProfileBuilder.build()
        
        controller.tabBar.tintColor = UIColor(hex: "#73f071")
        controller.setViewControllers([homeNavigationController,
                                       basketNavigationController,
                                       favoriteNavigationController,
                                       profileNavigationController], animated: true)

        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal

        return controller
    }
}

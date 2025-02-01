//
//  ProfileBuilder.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import Foundation
import UIKit

struct ProfileBuilder {
    static func build() -> UINavigationController {
        let profileViewStoryboard = UIStoryboard(name: "ProfileView", bundle: nil)
        let profileVC = profileViewStoryboard.instantiateViewController(withIdentifier: "ProfileView") as! ProfileViewController
        let profileNc = UINavigationController(rootViewController: profileVC)
        profileNc.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        profileVC.title = "Profile"

        let vm = ProfileViewModel()
        vm.delegate = profileVC
        profileVC.vm = vm

        return profileNc
    }
}

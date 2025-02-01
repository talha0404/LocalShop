//
//  OnboardingContracts.swift
//  LocalShop
//
//  Created by talha.sahin on 20.03.2024.
//

import Foundation

protocol OnboardingViewModelProtocol {
    var onboardingData: [OnboardingSliceItem] { get set }
    var currentPage: Int { get set }
    var isLastPage: Bool { get }    

    func loadOnboardingData()
    func nextPage()
    func buttonTitle() -> String    
}

//
//  OnboardingViewModel.swift
//  LocalShop
//
//  Created by talha.sahin on 20.03.2024.
//

import Foundation


final class OnboardingViewModel: OnboardingViewModelProtocol {
    var onboardingData: [OnboardingSliceItem] = []
    var currentPage: Int = 0
    var isLastPage: Bool {
        return currentPage == onboardingData.count - 1
    }

    func nextPage() {
        guard currentPage + 1 < onboardingData.count else { return }
        currentPage += 1
    }

    func buttonTitle() -> String {
        return isLastPage ? "Complete" : "Next"
    }

    func loadOnboardingData() {
         onboardingData = [
            OnboardingSliceItem(title: "Choose Product", secondaryTitle: "A product is the item offered for sale. \nA product can be a service or an item. It can be physical or in virtual or cyber form", image: "onboardFirst"),
            OnboardingSliceItem(title: "Make Payment", secondaryTitle: "Payment is the transfer of money services in exchange produtc or Payments typically made terms agreed", image: "onboardSecond"),
            OnboardingSliceItem(title: "Get Your Order", secondaryTitle: "Business or commerce an order is a stated intention either spoken to engage in a cemmercial transaction specific products", image: "onboardThird")
        ]
    }
}

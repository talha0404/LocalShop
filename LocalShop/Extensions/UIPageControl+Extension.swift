//
//  UIPageControl+Extension.swift
//  LocalShop
//
//  Created by talha.sahin on 23.03.2024.
//

import UIKit

extension UIPageControl {
    // Calculate the new page based on the tap location
    func currentPageForTapLocation(_ location: CGPoint) -> Int {
        let width = self.bounds.size.width / CGFloat(self.numberOfPages)
        let page = Int(location.x / width)
        return page
    }
}

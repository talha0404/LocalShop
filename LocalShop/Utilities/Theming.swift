//
//  Theming.swift
//  LocalShop
//
//  Created by talha.sahin on 18.03.2024.
//

import Foundation
import UIKit

public extension UIColor {
        struct Common { }

        struct Home { }

        struct Basket { }

        struct Favorite { }

        struct Profile { }
    }

public extension UIFont {
    struct Dynamic {
        public init () {}
        public var primary = UIFontMetrics.default.scaledFont(for: UIFont.Common.primaryUnscaled)
    }
   
    struct Common {
        public static let primaryUnscaled = UIFont(name: "4Text-Regular", size: 14.0) ?? defaultFont
        public static let primary = UIFontMetrics.default.scaledFont(for: UIFont(name: "4Text-Regular", size: 14.0) ?? defaultFont)
        public static let defaultFont = UIFont.systemFont(ofSize: 14.0)
    }
}

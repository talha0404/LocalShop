//
//  SearchBar.swift
//  LocalShop
//
//  Created by talha.sahin on 19.02.2024.
//

import UIKit

class SearchBar: UIView {

    @IBOutlet weak var searchBarTextView: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "SearchBar") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}

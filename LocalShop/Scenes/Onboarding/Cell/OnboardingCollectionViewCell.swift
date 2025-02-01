//
//  OnboardingCollectionViewCell.swift
//  LocalShop
//
//  Created by talha.sahin on 19.03.2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "OnboardingCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var secondaryTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureUICell(data: OnboardingSliceItem)  {
        title.text = data.title
        secondaryTitle.text = data.secondaryTitle
        image.image = UIImage(named: data.image)
    }
}

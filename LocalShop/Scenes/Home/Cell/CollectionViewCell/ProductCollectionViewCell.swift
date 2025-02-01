//
//  ProductCollectionViewCell.swift
//  LocalShop
//
//  Created by talha.sahin on 5.03.2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUICell()
    }

    func configureData(data: ProductElement) {
        descLbl.text = data.description
        priceLbl.text = String(data.price)
        loadImageTest(url: data.image)
    }

    private func loadImageTest(url: String) {
        Helper.loadImage(from: url) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            case .failure(let error):
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }

    private func configureUICell() {
        backgroundColor = .green
        layer.cornerRadius = 10.0
    }
}

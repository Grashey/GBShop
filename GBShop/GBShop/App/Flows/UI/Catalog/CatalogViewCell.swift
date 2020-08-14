//
//  CatalogViewCell.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 14.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class CatalogViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with product: CatalogModel) {
        nameLabel.text = product.name
        priceLabel.text = "\(product.price) руб."
        imageView.image = UIImage(named: "mickey mouse")
    }
}

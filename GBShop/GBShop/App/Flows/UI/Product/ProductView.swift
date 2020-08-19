//
//  ProductView.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class ProductView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addToBasketButton: UIButton!
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewLabel.text = "Отзывы:"
    }
    
    func configure(with product: ProductResult) {
        nameLabel.text = product.name
        priceLabel.text = "\(product.price) руб"
        descriptionLabel.text = product.description
        imageView.image = UIImage(named: "mickey mouse")
    }
}

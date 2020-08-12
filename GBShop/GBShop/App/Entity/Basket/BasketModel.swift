//
//  BasketModel.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct BasketModel: Codable {
    let productId: Int
    let productName: String
    let price: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}

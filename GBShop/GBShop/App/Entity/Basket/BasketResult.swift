//
//  BasketResult.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct BasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let products: [BasketModel]?
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case countGoods = "countGoods"
        case products = "contents"
    }
}

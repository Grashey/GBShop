//
//  CatalogResult.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 05.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct CatalogResult: Codable {
    let page: Int
    let products: [CatalogModel]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page_number"
        case products = "products"
    }
}

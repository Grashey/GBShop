//
//  AddToBasket.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Basket {
    struct AddToBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        
        let productId: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
                "quantity": quantity
            ]
        }
    }
}

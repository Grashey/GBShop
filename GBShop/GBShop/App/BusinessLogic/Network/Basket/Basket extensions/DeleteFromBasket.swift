//
//  DeleteFromBasket.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Basket {
    struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}

//
//  GetBasket.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Basket {
    struct GetBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}

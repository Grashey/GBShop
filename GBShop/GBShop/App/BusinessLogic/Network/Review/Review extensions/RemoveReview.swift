//
//  RemoveReview.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Review {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"
        
        let userId: Int
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "id_product": productId,
            ]
        }
    }
}

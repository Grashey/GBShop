//
//  FetchReviews.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Review {
    struct FetchReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "fetchReviews.json"
        
        let pageNumber: Int
        let productId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_product": productId,
            ]
        }
    }
}

//
//  AddReview.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Review {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        
        let userId: Int
        let productId: Int
        let userText: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "id_product": productId,
                "review_description": userText
            ]
        }
    }
}


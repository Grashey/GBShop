//
//  CatalogData.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 24.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Catalog {
    struct CatalogData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}

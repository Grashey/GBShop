//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 24.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func fetchCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void)
    func fetchProduct(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}

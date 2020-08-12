//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func addToBasket(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    func deleteFromBasket(productId: Int, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void)
}

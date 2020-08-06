//
//  Basket.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 06.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    //let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Basket: BasketRequestFactory {
    func addToBasket(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = AddToBasket(baseUrl: baseUrl, productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(productId: Int, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void) {
        let requestModel = GetBasket(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

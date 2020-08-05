//
//  Review.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
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

extension Review: ReviewRequestFactory {
    func addReview(productId: Int, userId: Int, userText: String, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userId: userId, productId: productId, userText: userText)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func fetchReviews(productId: Int, pageNumber: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = FetchReviews(baseUrl: baseUrl, pageNumber: pageNumber, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(productId: Int, userId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, userId: userId, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func removeReview(productId: Int, userId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
    func addReview(productId: Int, userId: Int, userText: String, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
    func fetchReviews(productId: Int, pageNumber: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
}

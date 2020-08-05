//
//  ReviewResult.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct ReviewResult: Codable {
    let result: Int
    let page: Int?
    let reviews: [ReviewModel]?
    let userMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case page = "page_number"
        case reviews = "reviews"
        case userMessage = "userMessage"
    }
}

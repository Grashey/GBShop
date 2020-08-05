//
//  ReviewModel.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 04.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct ReviewModel: Codable {
    let date: String
    let id: Int
    let name: String
    let reviewText: String
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case id = "id_user"
        case name = "user_name"
        case reviewText = "review_description"
    }
}

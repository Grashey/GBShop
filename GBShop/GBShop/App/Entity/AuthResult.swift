//
//  LoginResult.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct AuthResult: Codable {
    let result: Int
    let user: User?
}

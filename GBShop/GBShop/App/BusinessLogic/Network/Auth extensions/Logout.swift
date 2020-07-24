//
//  AuthLogout.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 22.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let id: Int
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}

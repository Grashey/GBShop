//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func registration(id: Int, userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

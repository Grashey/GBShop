//
//  Auth.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Auth: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func registration(id: Int, userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl,
                                        id: id,
                                        login: userName,
                                        password: password,
                                        email: "some@some.ru",
                                        gender: "male",
                                        creditCard: "9872389-2424-234224-234",
                                        bio: "This is good!")
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

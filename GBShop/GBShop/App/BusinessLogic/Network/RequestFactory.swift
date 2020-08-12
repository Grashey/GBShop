//
//  RequestFactory.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 20.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    lazy var errorParser = makeErrorParser()
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCatalogRequestFactory() -> CatalogRequestFactory {
        return Catalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        return Review(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeBasketRequestFactory() -> BasketRequestFactory {
        return Basket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
}

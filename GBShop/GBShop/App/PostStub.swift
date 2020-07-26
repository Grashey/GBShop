//
//  PostStub.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 24.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
    
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
}

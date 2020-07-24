//
//  UserSession.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 22.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import Foundation

class UserSession {
    
    static let instance = UserSession()
    private init(){}
    
    var token = String()
    var id = Int()
    var name = String()
    var password = String()
    var email = String()
    var gender = String()
    var creditCard = String()
    var bio = String()
}

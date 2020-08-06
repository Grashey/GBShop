//
//  AppDelegate.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 16.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()
    let user = UserSession.instance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let auth = requestFactory.makeAuthRequestFactory()
        let catalog = requestFactory.makeCatalogRequestFactory()
        let review = requestFactory.makeReviewRequestFactory()
        let basket = requestFactory.makeBasketRequestFactory()
        
        user.id = 123
        user.name = "Somebody"
        user.password = "mypassword"
        user.email = "some@some.ru"
        user.gender = "male"
        user.creditCard = "9872389-2424-234224-234"
        user.bio = "This is good! I think I will switch to another language"

        auth.registerUser(id: user.id, userName: user.name, password: user.password, email: user.email, gender: user.gender, creditCard: user.creditCard, bio: user.bio) { response in
            switch response.result {
                case .success(let answer):
                    print("registration ", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        auth.logout(id: user.id) { response in
            switch response.result {
                case .success(let answer):
                    print("logout", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        auth.login(userName: user.name, password: user.password) { response in
            switch response.result {
                case .success(let answer):
                    print("login", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        auth.editUserInfo(id: user.id, userName: user.name, password: user.password, email: user.email, gender: user.gender, creditCard: user.creditCard, bio: user.bio) { response in
            switch response.result {
                case .success(let answer):
                    print("edit", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        catalog.fetchCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
                case .success(let answer):
                    print("catalog", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        catalog.fetchProduct(productId: 123) { response in
            switch response.result {
                case .success(let answer):
                    print("product", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        review.fetchReviews(productId: 123, pageNumber: 1) { response in
            switch response.result {
                case .success(let answer):
                    print("fetchReview", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        review.addReview(productId: 123, userId: 123, userText: "Nice device") { response in
            switch response.result {
                case .success(let answer):
                    print("addReview", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        review.removeReview(productId: 123, userId: 123) { response in
            switch response.result {
                case .success(let answer):
                    print("removeReview", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        basket.addToBasket(productId: 123, quantity: 1) { response in
            switch response.result {
                case .success(let answer):
                    print("addToBasket", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        basket.deleteFromBasket(productId: 123) { response in
            switch response.result {
                case .success(let answer):
                    print("deleteFromBasket", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        basket.getBasket(userId: 123) { response in
            switch response.result {
                case .success(let answer):
                    print("getBasket", answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        return true
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


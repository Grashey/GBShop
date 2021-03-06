//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Aleksandr Fetisov on 16.07.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

class GBShopTests: XCTestCase {
    
    var errorParser: ErrorParserStub!
    let expectation = XCTestExpectation(description: "Download failed url")

    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        errorParser = nil
    }

//    func testShouldDownloadAndParse() {
//        AF.request("https://").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<PostStub>) in
//            switch response.result {
//            case .failure(_):
//                XCTFail()
//            case .success(_):
//                XCTAssert(true)
//            }
//            self?.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 10)
//    }
    
    func testLogIn() {
        let auth = Auth(errorParser: errorParser, sessionManager: Session())
        auth.login(userName: "test", password: "123456") { (response: AFDataResponse<AuthResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testLogOut() {
        let auth = Auth(errorParser: errorParser, sessionManager: Session())
        auth.logout(id: 1234) { (response: AFDataResponse<AuthResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testRegister() {
        let auth = Auth(errorParser: errorParser, sessionManager: Session())
        auth.registerUser(id: 1234, userName: "test", password: "test", email: "test", gender: "test", creditCard: "test", bio: "test") { (response: AFDataResponse<AuthResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testEditUserInfo() {
        let auth = Auth(errorParser: errorParser, sessionManager: Session())
        auth.editUserInfo(id: 1234, userName: "test", password: "test", email: "test", gender: "test", creditCard: "test", bio: "test") { (response: AFDataResponse<AuthResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchProduct() {
        let catalog = Catalog(errorParser: errorParser, sessionManager: Session())
        catalog.fetchProduct(productId: 12345) { (response: AFDataResponse<ProductResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchCatalog() {
        let catalog = Catalog(errorParser: errorParser, sessionManager: Session())
        catalog.fetchCatalog(pageNumber: 1, categoryId: 12345) { (response: AFDataResponse<CatalogResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testAddReview() {
        let review = Review(errorParser: errorParser, sessionManager: Session())
        review.addReview(productId: 123, userId: 123, userText: "Cool!") { (response: AFDataResponse<ReviewResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testRemoveReview() {
        let review = Review(errorParser: errorParser, sessionManager: Session())
        review.removeReview(productId: 123, userId: 123) { (response: AFDataResponse<ReviewResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchReviews() {
        let review = Review(errorParser: errorParser, sessionManager: Session())
        review.fetchReviews(productId: 123, pageNumber: 1) { (response: AFDataResponse<ReviewResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testAddToBasket() {
        let basket = Basket(errorParser: errorParser, sessionManager: Session())
        basket.addToBasket(productId: 123, quantity: 1) { (response: AFDataResponse<DefaultResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testDeleteFromBasket() {
        let basket = Basket(errorParser: errorParser, sessionManager: Session())
        basket.deleteFromBasket(productId: 123) { (response: AFDataResponse<DefaultResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testGetBasket() {
        let basket = Basket(errorParser: errorParser, sessionManager: Session())
        basket.getBasket(userId: 123) { (response: AFDataResponse<BasketResult>) in
            switch response.result {
                case .failure(_):
                    XCTFail()
                case .success(_):
                    XCTAssert(true)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    
}

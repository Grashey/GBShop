//
//  ProductViewController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class ProductViewController: ScrollableViewController {
    
    @IBOutlet var productView: ProductView!
    let userSession = UserSession.instance
    var productId: Int = 0
    var reviewsArray:[ReviewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = productView.scrollView
        productView.reviewTableView.delegate = self
        productView.reviewTableView.dataSource = self
    
        let requestFactory = userSession.requestFactory
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.fetchProduct(productId: productId) { response in
            switch response.result {
                case .success(let answer):
                    DispatchQueue.main.async {
                        self.productView.configure(with: answer)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
        let review = requestFactory.makeReviewRequestFactory()
        review.fetchReviews(productId: productId, pageNumber: 1) { response in
            switch response.result {
                case .success(let answer):
                    if let reviews = answer.reviews {
                        DispatchQueue.main.async {
                            self.reviewsArray = reviews
                            self.productView.reviewTableView.reloadData()
                        }
                    }
                  print(answer)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.reuseID, for: indexPath) as! ReviewCell
        let review = reviewsArray[indexPath.row]
        cell.configure(with: review)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultHeight: CGFloat = 100
        return defaultHeight
    }
}

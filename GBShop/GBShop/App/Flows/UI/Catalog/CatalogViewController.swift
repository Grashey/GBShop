//
//  CatalogViewController.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 14.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class CatalogViewController: UICollectionViewController {
    
    @IBOutlet var catalogView: UICollectionView!
    var products:[CatalogModel] = []
    let userSession = UserSession.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestFactory = userSession.requestFactory
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.fetchCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
                case .success(let answer):
                    if let products = answer.products {
                        DispatchQueue.main.async {
                            self.products = products
                           self.collectionView.reloadData()
                            print(products)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }


    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogViewCell.reuseID, for: indexPath) as! CatalogViewCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        let product = products[indexPath.row]
        destinationVC.productId = product.id
        self.navigationController?.pushViewController(destinationVC, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

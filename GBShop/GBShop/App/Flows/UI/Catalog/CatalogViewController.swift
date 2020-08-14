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

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

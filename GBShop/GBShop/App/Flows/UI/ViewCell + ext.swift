//
//  View.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 14.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit
protocol Reusable {}

extension UICollectionViewCell: Reusable {}

extension Reusable where Self: UICollectionViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}

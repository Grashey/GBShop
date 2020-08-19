//
//  ReviewCell.swift
//  GBShop
//
//  Created by Aleksandr Fetisov on 19.08.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    
    func configure(with review: ReviewModel) {
        nameLabel.text = review.name
        dateLabel.text = review.date
        reviewTextView.text = review.reviewText
    }
}

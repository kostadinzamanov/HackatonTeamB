//
//  ListCell.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import Foundation
import UIKit

class ListCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    var addToCartAction: (() -> Void)?
    
    func configure(recipie: Recipe) {
        imageView.image = recipie.image
        titleLabel.text = recipie.title
        prepTimeLabel.text = String(recipie.totalPrepTime)
//        var text = ""
//        for tag in recipie.tags {
//            text += tag
//        }
//        tagsLabel.text = text
    }
}

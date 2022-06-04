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
    @IBOutlet weak var cartButton: UIButton!
    
    var addToCartAction: (() -> Void)?
    var recipe: Recipe?
    
    func configure(recipie: Recipe) {
        recipe = recipie
        imageView.image = recipie.image
        titleLabel.text = recipie.title
        prepTimeLabel.text = String(recipie.totalPrepTime) + " h"
        setupIcon(selected: SelectedRecipiesManager.shared.isSelected(recipe: recipie))
        
        var text = ""
        recipie.ingredients.forEach { ingr in
            text += ingr.ingredient.description + " "
        }
        tagsLabel.text = text
    }
    
    @IBAction func addToCart() {
        if let addToCartAction = addToCartAction {
            addToCartAction()
        }
        setupIcon(selected: SelectedRecipiesManager.shared.isSelected(recipe: recipe!))
    }
    
    func setupIcon(selected: Bool) {
        cartButton.setImage(UIImage(systemName: selected ? "cart.fill" : "cart"), for: .normal)
    }
}

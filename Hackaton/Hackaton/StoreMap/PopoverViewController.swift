//
//  SSPopoverViewController.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import UIKit

class PopoverViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    var labelText: String?
    var items: [AddedIngredient] = []
    
    init(nibName: String?, bundle: Bundle? = nil, labelText: String?, items: [AddedIngredient], prefferedSize: CGSize, permittedArrowDirections: UIPopoverArrowDirection = .any) {
        super.init(nibName: nibName, bundle: bundle)
        modalPresentationStyle = .popover
        preferredContentSize = prefferedSize
        popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
        self.labelText = labelText
        self.items = items
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        compressIngredients()
        
        titleLabel.text = labelText
        var text = ""
        items.forEach { ingredient in
            let newLine = ingredient.ingredient.description + " " + String(ingredient.quantityAmount) + "g" + "\n"
            text += newLine
        }
        
        itemsLabel.text = text
        itemsLabel.sizeToFit()
    }
    
    func compressIngredients() {
        var compressed: [AddedIngredient] = []
        items.forEach { item in
            if let contained = compressed.first(where: {$0.ingredient.description == item.ingredient.description}) {
                let newItem = AddedIngredient(ingredient: item.ingredient, quantityAmount: item.quantityAmount + contained.quantityAmount)
                compressed.removeAll(where: {$0.ingredient.description == item.ingredient.description})
                compressed.append(newItem)
            } else {
                compressed.append(item)
            }
        }
        items = compressed
    }
}

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
    var items: [Ingredient] = []
    
    init(nibName: String?, bundle: Bundle? = nil, labelText: String?, items: [Ingredient], prefferedSize: CGSize, permittedArrowDirections: UIPopoverArrowDirection = .any) {
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
        titleLabel.text = labelText
        var text = ""
        items.forEach { ingredient in
            let newLine = ingredient.description + "\n"
            text += newLine
        }
        
        itemsLabel.text = text
        itemsLabel.sizeToFit()
    }
}

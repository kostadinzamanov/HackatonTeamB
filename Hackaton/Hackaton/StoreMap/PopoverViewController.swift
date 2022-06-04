//
//  SSPopoverViewController.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import UIKit

class PopoverViewController: UIViewController {

    @IBOutlet weak var primaryLabel: UILabel!
    var labelText: String?
    
    init(nibName: String?, bundle: Bundle? = nil, labelText: String?, prefferedSize: CGSize, permittedArrowDirections: UIPopoverArrowDirection = .any) {
        super.init(nibName: nibName, bundle: bundle)
        modalPresentationStyle = .popover
        preferredContentSize = prefferedSize
        popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
        self.labelText = labelText
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        primaryLabel.text = labelText
    }
}

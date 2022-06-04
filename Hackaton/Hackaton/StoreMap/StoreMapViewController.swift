//
//  StoreMapViewController.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import Foundation
import UIKit

class StoreMapViewController: UIViewController {
    @IBOutlet weak var meatView: UIView!
    @IBOutlet weak var diaryView: UIView!
    @IBOutlet weak var a1View: UIView!
    @IBOutlet weak var a2View: UIView!
    @IBOutlet weak var a3View: UIView!
    @IBOutlet weak var a4View: UIView!
    @IBOutlet weak var fruitAndVeggiesView: UIView!
    
    var recipies: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let popoverController = PopoverViewController(nibName: "PopoverViewController",
                                                        labelText: "Tap here to edit the journal or it's attachments.",
                                                        prefferedSize: CGSize(width: 250, height: 60))
        popoverController.popoverPresentationController?.sourceView = meatView
        popoverController.popoverPresentationController?.delegate = self

        
        self.present(popoverController, animated: true, completion: nil)
    }
}


extension StoreMapViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

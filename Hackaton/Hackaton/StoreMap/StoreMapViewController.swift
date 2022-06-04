//
//  StoreMapViewController.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import Foundation
import UIKit

class StoreLocation: NSObject {
    var type: Location
    var items: [AddedIngredient]
    var button: UIButton
    
    init(type: Location, items: [AddedIngredient], button: UIButton) {
        self.type = type
        self.items = items
        self.button = button
    }
}

class StoreMapViewController: UIViewController {
    @IBOutlet weak var meatView: UIView!
    @IBOutlet weak var diaryView: UIView!
    @IBOutlet weak var a1View: UIView!
    @IBOutlet weak var a2View: UIView!
    @IBOutlet weak var a3View: UIView!
    @IBOutlet weak var a4View: UIView!
    @IBOutlet weak var fruitAndVeggiesView: UIView!
    
    @IBOutlet weak var meatButton: UIButton!
    @IBOutlet weak var diaryButton: UIButton!
    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Button: UIButton!
    @IBOutlet weak var a4Button: UIButton!
    @IBOutlet weak var fruitAndVeggiesButton: UIButton!
    
    var recipies: [Recipe] = []
    var activeLocations: [StoreLocation] = []
    var allIngredients: [AddedIngredient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activeLocations = []
        allIngredients = []
        SelectedRecipiesManager.shared.selectedRecipies.forEach { item in
            item.ingredients.forEach { ingr in
                if !activeLocations.contains(where: {$0.type == ingr.ingredient.location}) {
                    let newLoc = StoreLocation(type: ingr.ingredient.location, items: [ingr], button: self.buttonFor(location: ingr.ingredient.location))
                    activeLocations.append(newLoc)
                } else {
                    let existingLoc = activeLocations.first(where: {$0.type == ingr.ingredient.location})!
                    existingLoc.items.append(ingr)
                }
                allIngredients.append(ingr)
            }
        }
        
        activeLocations.forEach { location in
            location.button.isHidden = false
        }
        
    }
    
    func buttonFor(location: Location) -> UIButton {
        switch location {
        case .meat:
            return meatButton
        case .diary:
            return diaryButton
        case .a1:
            return a1Button
        case .a2:
            return a2Button
        case .a3:
            return a3Button
        case .a4:
            return a4Button
        case .fruits:
            return fruitAndVeggiesButton
        }
    }
    
    func locationFor(button: UIButton) -> Location {
        switch button {
        case meatButton:
            return .meat
        case diaryButton:
            return .diary
        case a1Button:
            return .a1
        case a2Button:
            return .a2
        case a3Button:
            return .a3
        case a4Button:
            return .a4
        case fruitAndVeggiesButton:
            return .fruits
        default:
            return .meat
        }
    }
    
    @IBAction func showPopover(sender: UIButton) {
        let location = locationFor(button: sender)
        let storeLocation = activeLocations.first(where: {$0.type == location})
        
        var height: CGFloat = CGFloat(storeLocation!.items.count) * 20 + 40
        
        let popoverController = PopoverViewController(nibName: "PopoverViewController",
                                                      labelText: location.rawValue.capitalized,
                                                      items: storeLocation!.items, prefferedSize: CGSize(width: 150, height: height))
        popoverController.popoverPresentationController?.sourceView = sender
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

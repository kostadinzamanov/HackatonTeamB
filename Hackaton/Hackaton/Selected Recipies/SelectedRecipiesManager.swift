//
//  SelectedRecipiesManager.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import UIKit

class SelectedRecipiesManager: NSObject {
    static let shared = SelectedRecipiesManager()
    
    var selectedRecipies: [Recipe] = []
    
    var allRecipies: [Recipe] = []

    var allIngredients: [Ingredient]
    
    override init() {
        let pork = Ingredient(description: "Pork", quantityUnit: .gram, pricePerKilo: 10.50, location: .meat)
        let chicken = Ingredient(description: "Chicken", quantityUnit: .gram, pricePerKilo: 8.50, location: .meat)
        let garlic = Ingredient(description: "Garlic", quantityUnit: .gram, pricePerKilo: 1.50, location: .fruits)
        let mushrooms = Ingredient(description: "Mushrooms", quantityUnit: .gram, pricePerKilo: 17.50, location: .a1)
        let rosmary = Ingredient(description: "Rosmary", quantityUnit: .gram, pricePerKilo: 80.50, location: .a2)
        let milk = Ingredient(description: "Milk", quantityUnit: .gram, pricePerKilo: 4.00, location: .diary)
        let salt = Ingredient(description: "Salt", quantityUnit: .gram, pricePerKilo: 2.50, location: .a2)
        self.allIngredients = [pork, chicken, garlic, mushrooms, rosmary, milk, salt]
        
        let rec1 = Recipe(image: UIImage(imageLiteralResourceName: "pork.chops"), title: "Pork Chops", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: pork, quantityAmount: 500), AddedIngredient(ingredient: garlic, quantityAmount: 10), AddedIngredient(ingredient: salt, quantityAmount: 5)], preparationDescription: "Unbelievably tasty pork chops! First you chop the pork into pieces, then you add the seasoning to taste! Really I've no idea how those are cooked, just google it! Thank you, next :)")
        let rec2 = Recipe(image: UIImage(imageLiteralResourceName: "chicken.fillet"), title: "Chicken fillet", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: chicken, quantityAmount: 500), AddedIngredient(ingredient: garlic, quantityAmount: 10), AddedIngredient(ingredient: rosmary, quantityAmount: 20)], preparationDescription: "Well those are just chicken fillets. Slice them into pieces, season them and put them on the stove. Just wait unitl they look ready and take them out. Enjoy!")
        let rec3 = Recipe(image: UIImage(imageLiteralResourceName: "mushrooms"), title: "Baked Mushroom", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: mushrooms, quantityAmount: 500), AddedIngredient(ingredient: salt, quantityAmount: 5)], preparationDescription: "Honestly, I don't eat mushrooms, Kosta put this recipe in. Email him for details.")
        allRecipies = [rec1, rec2, rec3]
    }
    
    func isSelected(recipe: Recipe) -> Bool {
        return selectedRecipies.contains(where: {$0.title == recipe.title})
    }
    
    func addRemove(item: Recipe) {
        if selectedRecipies.contains(where: {$0.title == item.title}) {
            selectedRecipies.removeAll(where: {$0.title == item.title})
        } else {
            selectedRecipies.append(item)
        }
    }

}

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
        
        let rec1 = Recipe(image: UIImage(systemName: "book")!, title: "Pork Chops", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: pork, quantityAmount: 500), AddedIngredient(ingredient: garlic, quantityAmount: 10), AddedIngredient(ingredient: salt, quantityAmount: 5)], preparationDescription: "some description")
        let rec2 = Recipe(image: UIImage(systemName: "book")!, title: "Chicken fillet", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: chicken, quantityAmount: 500), AddedIngredient(ingredient: garlic, quantityAmount: 10), AddedIngredient(ingredient: rosmary, quantityAmount: 20)], preparationDescription: "some description")
        let rec3 = Recipe(image: UIImage(systemName: "book")!, title: "Baked Mushroom", totalPrepTime: 1.5, ingredients: [AddedIngredient(ingredient: mushrooms, quantityAmount: 500), AddedIngredient(ingredient: salt, quantityAmount: 5)], preparationDescription: "some description")
        allRecipies = [rec1, rec2, rec3]
    }
}

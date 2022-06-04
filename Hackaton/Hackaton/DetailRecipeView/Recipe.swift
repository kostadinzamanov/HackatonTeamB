//
//  Recipe.swift
//  Hackaton
//
//  Created by Ivaylo Kalaydzhiev on 4.06.22.
//

import UIKit

struct Recipe {
    
    let image: UIImage
    let title: String
    var totalPrice: Double {
        ingredients.map({$0.pricePerKilo * Double(($0.quantityAmount / 1000))}).reduce(0, +)
    }
    let totalPrepTime: Double
    let ingredients: [Ingredient]
    let preparationDescription: String
}

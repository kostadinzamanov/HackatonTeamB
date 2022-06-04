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
    var totalPrice: String {
        let price = ingredients.map({$0.price}).reduce(0, +)
        let result = String(format: "%.2f", price)
        return result + "$"
    }
    let totalPrepTime: Double
    let ingredients: [AddedIngredient]
    let preparationDescription: String
}


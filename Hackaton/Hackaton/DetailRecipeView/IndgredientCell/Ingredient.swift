//
//  Ingredient.swift
//  Hackaton
//
//  Created by Ivaylo Kalaydzhiev on 4.06.22.
//

import Foundation

struct Ingredient {
    let description: String
    let quantityUnit: MeasurementUnit
    let pricePerKilo: Double
    let location: Location
}

struct AddedIngredient {
    let ingredient: Ingredient
    let quantityAmount: Int
    var price: Double {
        (Double(quantityAmount) / 1000) * ingredient.pricePerKilo
    }
}

enum MeasurementUnit: String {
    case gram = "g"
    case milliliter = "ml"
}

enum Location: String {
    case meat
    case diary
    case a1
    case a2
    case a3
    case a4
    case fruits
}

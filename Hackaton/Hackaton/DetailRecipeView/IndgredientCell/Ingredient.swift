//
//  Ingredient.swift
//  Hackaton
//
//  Created by Ivaylo Kalaydzhiev on 4.06.22.
//

import Foundation

struct Ingredient {
    
    let description: String
    let quantityAmount: Int
    let quantityUnit: MeasurementUnit
    let pricePerKilo: Double
}

enum MeasurementUnit: String {
    
    case gram
    case milliliter
}



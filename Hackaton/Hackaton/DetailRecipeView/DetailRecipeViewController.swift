//
//  DetailRecipeViewController.swift
//  Hackaton
//
//  Created by Ivaylo Kalaydzhiev on 4.06.22.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    // MARK: - Mock data
    private let mockIngredients = [Ingredient(description: "Potato",
                                              quantityAmount: 200,
                                              quantityUnit: .gram,
                                              pricePerKilo: 1.20),
                                   Ingredient(description: "Carrot",
                                              quantityAmount: 50,
                                              quantityUnit: .gram,
                                              pricePerKilo: 0.70),
                                   Ingredient(description: "Chicken",
                                              quantityAmount: 400,
                                              quantityUnit: .gram,
                                              pricePerKilo: 12.0)]
    
    private lazy var mockRecipe = Recipe(image: UIImage(systemName: "book")!,
                                         title: "Mock Recipe",
                                         totalPrepTime: 1.5,
                                         ingredients: mockIngredients,
                                         preparationDescription: "Very cool way to cook your food!")
    
    // MARK: - Properties
    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var recipeTitleLabel: UILabel!
    @IBOutlet private weak var quickInfoLabel: UILabel!
    @IBOutlet private weak var ingredientsTableView: UITableView!
    @IBOutlet private weak var preparationTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTableView.dataSource = self
        
        ingredientsTableView.register(IngredientTableViewCell.self,
                                      forCellReuseIdentifier: "IngredientCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUp()
        ingredientsTableView.reloadData()
    }
    
    // MARK: - Methods
    private func setUp() {
        recipeImage.image = mockRecipe.image
        recipeTitleLabel.text = mockRecipe.title
        quickInfoLabel.text = "Time: \(mockRecipe.totalPrepTime) Price: \(mockRecipe.totalPrice)"
        preparationTextView.text = mockRecipe.preparationDescription
    }
}

// MARK: - UITableViewDataSource
extension DetailRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        guard let ingredientCell = cell as? IngredientTableViewCell else { return UITableViewCell() }
        
        let ingredientModel = mockIngredients[indexPath.row]
        ingredientCell.descriptionLabel.text = ingredientModel.description
        ingredientCell.amountLabel.text = String(ingredientModel.quantityAmount)
        ingredientCell.unitLabel.text = ingredientModel.quantityUnit.rawValue
        
        return cell
    }
}

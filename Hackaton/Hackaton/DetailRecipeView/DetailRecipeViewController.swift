//
//  DetailRecipeViewController.swift
//  Hackaton
//
//  Created by Ivaylo Kalaydzhiev on 4.06.22.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var recipeTitleLabel: UILabel!
    @IBOutlet private weak var quickInfoLabel: UILabel!
    @IBOutlet private weak var ingredientsTableView: UITableView!
    @IBOutlet private weak var preparationTextView: UITextView!
    
    private let mockRecipe = SelectedRecipiesManager.shared.allRecipies.first!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTableView.dataSource = self
        
        ingredientsTableView.register(UINib(nibName: "IngredientTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: "IngredientCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUp()
    }
    
    // MARK: - Methods
    private func setUp() {
        recipeImage.image = mockRecipe.image
        recipeTitleLabel.text = mockRecipe.title
        quickInfoLabel.text = "Time: \(mockRecipe.totalPrepTime) Price: \(mockRecipe.totalPrice)"
        preparationTextView.text = mockRecipe.preparationDescription
        preparationTextView.isEditable = false
    }
}

// MARK: - UITableViewDataSource
extension DetailRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockRecipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        guard let ingredientCell = cell as? IngredientTableViewCell else { return UITableViewCell() }
        
        let ingredientModel = mockRecipe.ingredients[indexPath.row]
        ingredientCell.descriptionLabel.text = ingredientModel.ingredient.description
        ingredientCell.amountLabel.text = String(ingredientModel.quantityAmount)
        ingredientCell.unitLabel.text = ingredientModel.ingredient.quantityUnit.rawValue
        
        return ingredientCell
    }
}

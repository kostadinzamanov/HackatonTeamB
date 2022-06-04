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
    
    var recipe: Recipe!
    
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
        setUpImage()
        recipeTitleLabel.text = recipe.title
        quickInfoLabel.text = "Time: \(recipe.totalPrepTime) Price: \(recipe.totalPrice)"
        preparationTextView.text = recipe.preparationDescription
        preparationTextView.isEditable = false
    }
    
    private func setUpImage() {
        recipeImage.image = recipe.image
        
        let view = UIView(frame: recipeImage.frame)

        let gradient = CAGradientLayer()

        gradient.frame = view.frame

        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]

        gradient.locations = [0.0, 0.8]

        view.layer.insertSublayer(gradient, at: 0)

        recipeImage.addSubview(view)

        recipeImage.bringSubviewToFront(view)
    }
}

// MARK: - UITableViewDataSource
extension DetailRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        guard let ingredientCell = cell as? IngredientTableViewCell else { return UITableViewCell() }
        
        let ingredientModel = recipe.ingredients[indexPath.row]
        ingredientCell.descriptionLabel.text = ingredientModel.ingredient.description
        ingredientCell.amountLabel.text = String(ingredientModel.quantityAmount)
        ingredientCell.unitLabel.text = ingredientModel.ingredient.quantityUnit.rawValue
        
        return ingredientCell
    }
}

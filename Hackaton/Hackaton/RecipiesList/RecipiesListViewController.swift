//
//  RecipiesListViewController.swift
//  Hackaton
//
//  Created by Kostadin Zamanov on 4.06.22.
//

import Foundation
import UIKit

class RecipiesListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func addToCart(recipie: Recipe) {
        SelectedRecipiesManager.shared.addRemove(item: recipie)
    }
    
    @IBAction func addNewRecipie() {
        
    }
}


extension RecipiesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SelectedRecipiesManager.shared.allRecipies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.addCellShadow(color: UIColor.darkGray, opacity: 0.5)
        cell.configure(recipie: SelectedRecipiesManager.shared.allRecipies[indexPath.row])
        cell.addToCartAction = { [weak self] in
            guard let self = self else {return}
            self.addToCart(recipie: SelectedRecipiesManager.shared.allRecipies[indexPath.row])
        }
        return cell
    }
}

extension RecipiesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailsStoryboard", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailRecipeViewController
        navigationController?.pushViewController(detailsVC!, animated: true)
    }
}

extension RecipiesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width - 40, height: 120)
    }
}

extension UICollectionViewCell {
    func addCellShadow(color: UIColor, opacity: Float) {
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}


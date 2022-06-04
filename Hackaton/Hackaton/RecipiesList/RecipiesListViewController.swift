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
}


extension RecipiesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath)
        cell.addCellShadow(color: UIColor.green, opacity: 0.5)
        return cell
    }
}

extension RecipiesListViewController: UICollectionViewDelegate {

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


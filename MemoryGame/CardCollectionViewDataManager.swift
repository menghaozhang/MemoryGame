//
//  CardCollectionViewDataManager.swift
//  MemoryGame
//
//  Created by paul on 16/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit

final class CardCollectionViewDataManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var previousSelectedCell: CardCollectionViewCell?
    
    private struct Constants {
        static let numberOfSections = 1
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card_reuse_id", for: indexPath) as! CardCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        handleCellSelect(currentSelectedCell: cell)
    }
    
    private func handleCellSelect(currentSelectedCell: CardCollectionViewCell) {
        if let previousCell = previousSelectedCell, previousCell != currentSelectedCell {
            currentSelectedCell.tapped = true
            previousSelectedCell = nil
            if previousCell.cardID == currentSelectedCell.cardID {
                previousCell.paired = true
                currentSelectedCell.paired = true
                print("match!!!")
            }else {
                currentSelectedCell.tapped = false
                previousCell.tapped = false
            }
        }else {
            currentSelectedCell.tapped = true
            previousSelectedCell = currentSelectedCell
        }
    }
    
    
    
    
}


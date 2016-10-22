//
//  CardCollectionViewDataManager.swift
//  MemoryGame
//
//  Created by paul on 16/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Data source and delegate for game view
 */
final class CardCollectionViewDataManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    // TODO: change this to a graceful way
    internal var array: [Int]! = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5]
    internal var fliped = Array(repeating: false, count: 20)
    private var previousSelectedCell: CardCollectionViewCell?
    
    private struct Constants {
        static let numberOfSections = 1
        static let messageViewAutoDismissDuration: Double = 1
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card_reuse_id", for: indexPath) as! CardCollectionViewCell
            cell.cardID = String(array[indexPath.item])
            cell.tapped = fliped[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCellSelect(collectionView: collectionView, indexPath: indexPath)
    }
    
    private func handleCellSelect(collectionView: UICollectionView, indexPath: IndexPath) {
        let currentSelectedCell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        guard !currentSelectedCell.paired else {
            return
        }
        fliped[indexPath.item] = true
        if let previousCell = previousSelectedCell, previousCell != currentSelectedCell {
            currentSelectedCell.tapped = true
            previousSelectedCell = nil
            if previousCell.cardID == currentSelectedCell.cardID {
                previousCell.paired = true
                currentSelectedCell.paired = true
                
                print("match!!!")
            }else {
                fliped[(collectionView.indexPath(for: previousCell)!.item)] = false
                fliped[(collectionView.indexPath(for: currentSelectedCell)!.item)] = false
                let delayTime = DispatchTime.now() + Constants.messageViewAutoDismissDuration
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    currentSelectedCell.tapped = false
                    previousCell.tapped = false
                }
            }
        }else {
            currentSelectedCell.tapped = true
            previousSelectedCell = currentSelectedCell
        }
    }
}



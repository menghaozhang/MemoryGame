//
//  CardCollectionViewLayout.swift
//  MemoryGame
//
//  Created by paul on 16/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 For future usage. If there is a need for different layout
 */
final class CardCollectionViewLayout: UICollectionViewFlowLayout {
        
    override init() {
        super.init()
        scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        SizeCalculator.sharedInstance.traitCollection = self.collectionView?.traitCollection
        itemSize = SizeCalculator.sharedInstance.itemSize()
    }
}

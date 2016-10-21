//
//  CardCollectionViewLayout.swift
//  MemoryGame
//
//  Created by paul on 16/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/* For future usage. If there is a need for different layout
 */
final class CardCollectionViewLayout: UICollectionViewFlowLayout {
    
    private struct Constants {
        static let cellWidth: CGFloat = 80
        static let cellLength: CGFloat = 80
    }
        
    override init() {
        super.init()
        itemSize = CGSize(width: Constants.cellWidth, height: Constants.cellLength)
        scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

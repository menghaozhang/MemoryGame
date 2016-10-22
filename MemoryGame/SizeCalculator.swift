//
//  SizeCalculator.swift
//  MemoryGame
//
//  Created by paul on 22/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/** 
 Implemnetation of the item size calculator
 */
final class SizeCalculator: ItemSizeCalculator {
    
    static let sharedInstance = SizeCalculator()
    
    private struct Constants {
        static let compactCellWidth: CGFloat = 80
        static let compactCellHeight: CGFloat = 80
        static let regularCellWidth: CGFloat = 120
        static let regularCellHeight: CGFloat = 120
    }
    
    internal var traitCollection: UITraitCollection?
    
    internal func updateTraitCollection(traitCollection: UITraitCollection) {
        self.traitCollection = traitCollection
    }
    
    internal func itemSize() -> CGSize {
        if traitCollection != nil {
            if Helper.sharedInstance.isSizeClassVerticalCompact(traitCollection: traitCollection!) {
                return CGSize(width: Constants.regularCellWidth, height: Constants.regularCellHeight)
            }
            return CGSize(width: Constants.compactCellWidth, height: Constants.compactCellHeight)
        }
        return CGSize(width: Constants.compactCellWidth, height: Constants.compactCellHeight)
    }
}

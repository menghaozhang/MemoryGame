//
//  itemSizeCalculator.swift
//  MemoryGame
//
//  Created by paul on 22/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Protocol which calculates the size of the collection view items.
 */
protocol ItemSizeCalculator {
    ///Current trait collection, conforming class should know the trait collection for item size calculation.
    var traitCollection: UITraitCollection? { get }
    
    ///update the trait collection before calling the item size as size of the items vary with trait collection.Pass collection view trait collection.
    func updateTraitCollection(traitCollection: UITraitCollection)
}

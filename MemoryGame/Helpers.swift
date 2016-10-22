//
//  Helpers.swift
//  MemoryGame
//
//  Created by paul on 22/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Helper class for get the current orientation
 */
final class Helper {
    
    static let sharedInstance = Helper()
    ///Device type iPhone in landscape orientation
    internal func isSizeClassVerticalCompact(traitCollection: UITraitCollection) -> Bool {
        return traitCollection.containsTraits(in: UITraitCollection(traitsFrom: [UITraitCollection(verticalSizeClass: .compact)]))
    }
}

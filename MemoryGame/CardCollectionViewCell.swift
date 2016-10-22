//
//  CardCollectionViewCell.swift
//  MemoryGame
//
//  Created by paul on 16/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/* custom colleciton view cell for game view
 */
final class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView: UIImageView!
    internal var cardID: String = ""
    internal var tapped: Bool! {
        didSet{
            if tapped ?? false {
                cardView.image = UIImage(named: "cardFront"  + cardID)
            }else {
                cardView.image = UIImage(named: "cardBack")
            }
        }
    }
    internal var paired: Bool!
    
    override func awakeFromNib() {
        tapped = false
        paired = false
    }
}

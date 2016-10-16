//
//  ViewController.swift
//  MemoryGame
//
//  Created by paul on 15/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {
    @IBOutlet weak var gameView: CardCollectionView! {
        didSet{
            gameView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "card_reuse_id")
        }
    }
    private let cardViewCellDataManager = CardCollectionViewDataManager()
    private let cardCollectionViewLayout = CardCollectionViewLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        gameView.collectionViewLayout = cardCollectionViewLayout
        gameView.dataSource = cardViewCellDataManager
        gameView.delegate = cardViewCellDataManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


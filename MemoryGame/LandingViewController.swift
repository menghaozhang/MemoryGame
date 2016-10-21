//
//  ViewController.swift
//  MemoryGame
//
//  Created by paul on 15/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
import CoreGraphics

/* UIViewController subclass which renders game view.
 */
final class LandingViewController: UIViewController {
    
    private var gameView: CardCollectionView!
    private let cardViewCellDataManager = CardCollectionViewDataManager()
    private let cardCollectionViewLayout = CardCollectionViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = CardCollectionView(frame: CGRect.zero, collectionViewLayout: CardCollectionViewLayout())
        view.addSubview(gameView)
        
        gameView.dataSource = cardViewCellDataManager
        gameView.delegate = cardViewCellDataManager
        gameView.backgroundColor = .white
        
        layoutGameView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func layoutGameView() {
        gameView.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: gameView.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: gameView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: gameView.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: gameView.bottomAnchor).isActive = true
    }
}


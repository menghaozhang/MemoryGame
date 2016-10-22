//
//  ViewController.swift
//  MemoryGame
//
//  Created by paul on 15/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
import CoreGraphics

/**
 UIViewController subclass which renders game view.
 */
final class LandingViewController: UIViewController {
    
    @IBOutlet weak var gameHeaderView: UIView!
    
    @IBAction func restartGame(_ sender: UIButton) {
        cleanUpGame()
        setUpGame()
    }
    
    private var gameView: CardCollectionView?
    private let cardViewCellDataManager = CardCollectionViewDataManager()
    private let cardCollectionViewLayout = CardCollectionViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            cleanUpGame()
            setUpGame()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func cleanUpGame() {
        if gameView != nil {
            gameView?.removeFromSuperview()
        }
    }
    
    private func setUpGame() {
        gameView = CardCollectionView(frame: CGRect.zero, collectionViewLayout: cardCollectionViewLayout)
        view.addSubview(gameView!)
        cardViewCellDataManager.array = cardViewCellDataManager.array.shuffled()
        
        gameView?.dataSource = cardViewCellDataManager
        gameView?.delegate = cardViewCellDataManager
        gameView?.backgroundColor = .white
        
        layoutGameView()
    }
    
    private func layoutGameView() {
        if let game = gameView {
            game.translatesAutoresizingMaskIntoConstraints = false
            gameHeaderView.bottomAnchor.constraint(equalTo: game.topAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: game.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: game.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: game.bottomAnchor).isActive = true
        }
    }
}


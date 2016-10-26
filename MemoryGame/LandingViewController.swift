//
//  ViewController.swift
//  MemoryGame
//
//  Created by paul on 15/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
import CoreGraphics
import 

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
        self.request = Alamofire.request(.GET, "http://www.bbc.co.uk/radio1/playlist.json", headers: genericRemoteService.headers()).response { [weak self] (request, response, data, error) in
//
//            guard let strongSelf = self else {
//                MessageDispatcherFactory.messageDispatcher().dispatchMessage(InternalMessage.netWorkError())
//                completion(page: nil, error: nil)
//                return
//            }
//            
//            guard error == nil else {
//                strongSelf.genericRemoteService.handleError(error!, errorCode: ErrorCode.Network, api: ErrorFacility.ContentApi, view: DimensionView.PageController)
//                strongSelf.genericRemoteService.removeProgressIndicator()
//                strongSelf.genericRemoteService.dispatchLoadingError(error! as NSError)
//                completion(page: nil, error: error)
//                return
//            }
//            
//            if let validData = data , validData.length > 0 {
//                let content: Content?
//                do {
//                    try content = Content.parseFromData(validData)
//                    
//                    if let contentData = content {
//                        let page = Constants.protoBufferParser.parse(contentData)
//                        strongSelf.genericRemoteService.removeProgressIndicator()
//                        completion(page: page, error: nil)
//                    }
//                } catch _ {
//                    let parseError = NSError(domain: Constants.parseError, code: Constants.ErrorCodeCannotParseResponse, userInfo: nil)
//                    strongSelf.genericRemoteService.dispatchLoadingError(parseError)
//                    strongSelf.genericRemoteService.handleError(parseError, errorCode: ErrorCode.InvalidResponse, api: ErrorFacility.ContentApi, view: DimensionView.PageController)
//                    strongSelf.genericRemoteService.removeProgressIndicator()
//                    completion(page: nil, error: nil)
//                }
//            } else {
//                strongSelf.genericRemoteService.handleInvalidDataError(.ContentApi)
//                completion(page: nil, error: nil)
//            }
//        }
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


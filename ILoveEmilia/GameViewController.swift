//
//  GameViewController.swift
//  ILoveEmilia
//
//  Created by Darin Minamoto on 9/23/16.
//  Copyright © 2016 com.d_m. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum BestGrillState {
    case emilia
    case rem
}

protocol GameControllerDelegate: class {
    func changeScene(state: BestGrillState)
}

class GameViewController: UIViewController, GameControllerDelegate {
    override func loadView() {
        let frame = UIScreen.main.bounds
        let view = SKView(frame: frame)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeScene(state: .emilia)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: GameViewDelegate methods
    
    func changeScene(state: BestGrillState) {
        if let view = self.view as! SKView? {
            switch state {
            case .emilia:
                let scene = EmiliaScene(size: self.view.bounds.size)
                scene.scaleMode = .aspectFill
                scene.gameDelegate = self
                
                view.presentScene(scene)
            case .rem:
                let scene = RemScene(size: self.view.bounds.size)
                scene.scaleMode = .aspectFill
                scene.gameDelegate = self
                
                view.presentScene(scene)
            }
        }
    }
}

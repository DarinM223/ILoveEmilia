//
//  RemScene.swift
//  ILoveEmilia
//
//  Created by Darin Minamoto on 11/13/16.
//  Copyright © 2016 com.d_m. All rights reserved.
//

import SpriteKit
import GameplayKit

class RemScene: SKScene {
    let rem: SKSpriteNode
    weak var gameDelegate: GameControllerDelegate?
    
    override init(size: CGSize) {
        let rem = SKSpriteNode(imageNamed: "rem.png")
        self.rem = rem
        super.init(size: size)
        
        self.backgroundColor = SKColor.white
        
        self.setUpRem()
    }
    
    private func setUpRem() {
        self.rem.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        let bounds = CGSize(width: 300, height: 300)
        self.rem.scale(to: bounds)
        
        let angle = CGFloat(Double.pi) / 16.0
        self.rem.run(SKAction.repeatForever(SKAction.group([
            SKAction.sequence([
                SKAction.scale(by: 2, duration: 0.5),
                SKAction.scale(by: 0.5, duration: 0.5),
                SKAction.scale(by: 2, duration: 0.5),
                SKAction.scale(by: 0.5, duration: 0.5)
            ]),
            SKAction.sequence([
                SKAction.rotate(byAngle: angle, duration: 0.5),
                SKAction.rotate(byAngle: -angle, duration: 0.5),
                SKAction.rotate(byAngle: -angle, duration: 0.5),
                SKAction.rotate(byAngle: angle, duration: 0.5)
            ])
        ])))
        self.addChild(self.rem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameDelegate?.changeScene(state: .emilia)
    }
}

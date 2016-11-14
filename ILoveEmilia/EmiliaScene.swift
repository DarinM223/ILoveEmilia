//
//  EmiliaScene.swift
//  ILoveEmilia
//
//  Created by Darin Minamoto on 9/23/16.
//  Copyright © 2016 com.d_m. All rights reserved.
//

import SpriteKit
import GameplayKit

class EmiliaScene: SKScene {
    let label: SKLabelNode
    let emilia: SKSpriteNode
    weak var gameDelegate: GameControllerDelegate?
    
    override init(size: CGSize) {
        let label = SKLabelNode(text: .some("I love Emilia."))
        let emilia = SKSpriteNode(imageNamed: "gao.png")
        self.label = label
        self.emilia = emilia

        super.init(size: size)
        
        self.backgroundColor = .white
        
        self.setUpLabel()
        self.setUpEmilia()
        self.setUpWorld()
    }
    
    private func setUpLabel() {
        self.label.fontColor = SKColor.black
        self.label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(self.label)
    }
    
    private func setUpEmilia() {
        let bounds = CGSize(width: 300, height: 300)
        self.emilia.position = CGPoint(x: self.frame.midX, y: self.frame.midY / 2)
        self.emilia.scale(to: bounds)
        
        // Set physics properties of bouncing Emilia.
        self.emilia.physicsBody = SKPhysicsBody(rectangleOf: bounds)
        self.emilia.physicsBody?.isDynamic = true
        self.emilia.physicsBody?.restitution = 1 // Makes Emilia bounce exitedly.
        self.emilia.physicsBody?.categoryBitMask = Constants.EmiliaCategory
        self.emilia.physicsBody?.collisionBitMask = Constants.WallCategory
        self.addChild(self.emilia)
    }
    
    private func setUpWorld() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: Constants.Gravitational)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.categoryBitMask = Constants.WallCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameDelegate?.changeScene(state: .rem)
    }
}

//
//  GameScene.swift
//  NagoyaMeibutsu
//
//  Created by 佐藤健一朗 on 2015/04/15.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene {
    
    var bowl:SKSpriteNode? // Donburi
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        self.setBackground()
        self.setBowl()
        self.fallNagoyaSpecialty()
    }
    
    func setBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.size = self.size
        
        self.addChild(background)
    }
    
    func setBowl() {
        let bowlTexture = SKTexture(imageNamed: "bowl")
        let bowl = SKSpriteNode(texture: bowlTexture)
        bowl.position = CGPoint(x: self.size.width * 0.5, y: 100)
        bowl.size = CGSize(width: bowlTexture.size().width * 0.5,
            height: bowlTexture.size().height * 0.5)
        bowl.physicsBody = SKPhysicsBody(texture: bowlTexture, size: bowl.size)
        bowl.physicsBody?.dynamic = false
        self.bowl = bowl
        
        self.addChild(bowl)
    }
    
    func fallNagoyaSpecialty() {
        let texture = SKTexture(imageNamed: "0")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPointMake(self.size.width * 0.5, self.size.height)
        sprite.size = CGSize(width: sprite.size.width * 0.5, height: sprite.size.height * 0.5)
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        
        self.addChild(sprite)
    }
}

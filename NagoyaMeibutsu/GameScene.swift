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
    var timer:NSTimer?
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        self.setBackground()
        self.setBowl()
        self.fallNagoyaSpecialty()
        self.setTimer()
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
        let index = Int(arc4random_uniform(7))
        let texture = SKTexture(imageNamed: "\(index)")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPointMake(self.size.width * 0.5, self.size.height)
        sprite.size = CGSize(width: sprite.size.width * 0.5, height: sprite.size.height * 0.5)
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        
        self.addChild(sprite)
    }
    
    func setTimer() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "fallNagoyaSpecialty", userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch : AnyObject = touches.first {
            let location = touch.locationInNode(self)
            let action = SKAction.moveTo(CGPoint(x: location.x, y: 100), duration: 0.2)
            self.bowl?.runAction(action)
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch : AnyObject = touches.first {
            let location = touch.locationInNode(self)
            let action = SKAction.moveTo(CGPoint(x: location.x, y: 100), duration: 0.2)
            self.bowl?.runAction(action)
        }
    }
}

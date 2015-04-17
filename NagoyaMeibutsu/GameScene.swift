//
//  GameScene.swift
//  NagoyaMeibutsu
//
//  Created by 佐藤健一朗 on 2015/04/15.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    
    var bowl:SKSpriteNode? // Donburi
    var timer:NSTimer?
    var gameOverDetectShape:SKShapeNode?
    
    var score = 0
    var scoreLabel:SKLabelNode?
    let scoreList = [100, 200, 300, 500, 800, 1000, 1500]
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
        
        self.setBackground()
        self.setGameOverDetectShape()
        self.setBowl()
        self.setScoreLabel()
        self.fallNagoyaSpecialty()
        self.setTimer()
    }
    
    func setBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.size = self.size
        
        self.addChild(background)
    }
    
    func setGameOverDetectShape() {
        let shape = SKShapeNode(rectOfSize: CGSize(width: self.size.width * 3, height: 10))
        shape.position = CGPoint(x: self.size.width * 0.5, y: -10)
        
        let physicsBody = SKPhysicsBody(rectangleOfSize: shape.frame.size)
        physicsBody.dynamic = false
        physicsBody.contactTestBitMask = 0x1 << 1
        shape.physicsBody = physicsBody
        self.gameOverDetectShape = shape
        self.addChild(shape)
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
    
    func setScoreLabel() {
        var scoreLabel = SKLabelNode(fontNamed: "Helvetica")
        scoreLabel.position = CGPoint(x: self.size.width * 0.92, y: self.size.height * 0.78)
        scoreLabel.text = "¥0"
        scoreLabel.fontSize = 32
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right
        scoreLabel.fontColor = UIColor.greenColor()
        self.addChild(scoreLabel)
        self.scoreLabel = scoreLabel
    }
    
    func fallNagoyaSpecialty() {
        let index = Int(arc4random_uniform(7))
        let texture = SKTexture(imageNamed: "\(index)")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPointMake(self.size.width * 0.5, self.size.height)
        sprite.size = CGSize(width: sprite.size.width * 0.5, height: sprite.size.height * 0.5)
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        sprite.physicsBody?.contactTestBitMask = 0x1 << 1
        self.addChild(sprite)
        
        self.score += self.scoreList[index]
        self.scoreLabel?.text = "¥\(self.score)"
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
    
    func didBeginContact(contact: SKPhysicsContact) {
        if (contact.bodyA.node == self.gameOverDetectShape ||
            contact.bodyB.node == self.gameOverDetectShape) {
                self.showGameOver()
        }
    }
    
    func showGameOver() {
        let sprite = SKSpriteNode(imageNamed: "gameover")
        sprite.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        self.addChild(sprite)
        self.paused = true
        self.timer?.invalidate()
    }
}

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
    
    override func didMoveToView(view: SKView) {
        self.setBackground()
        self.fallNagoyaSpecialty()
    }
    
    func setBackground() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.size = self.size
        
        self.addChild(background)
    }
    
    func fallNagoyaSpecialty() {
        let texture = SKTexture(imageNamed: "0")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        sprite.size = CGSize(width: sprite.size.width * 0.5, height: sprite.size.height * 0.5)
        
        self.addChild(sprite)
    }
}

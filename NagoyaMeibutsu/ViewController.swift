//
//  ViewController.swift
//  NagoyaMeibutsu
//
//  Created by 佐藤健一朗 on 2015/04/15.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! SKView
        view.showsNodeCount = true
        view.showsFPS = true
    
        // create Scene
        let scene = GameScene()
        scene.size = view.frame.size
        
        view.presentScene(scene)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  GameScene.swift
//  SpaceShooter
//
//  Created by Seth Danner on 3/23/19.
//  Copyright © 2019 Seth Danner. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: 0, y: 1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        
        starfield.zPosition = -1
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

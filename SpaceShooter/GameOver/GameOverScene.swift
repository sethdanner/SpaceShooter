//
//  GameOverScene.swift
//  SpaceShooter
//
//  Created by Seth Danner on 3/28/19.
//  Copyright © 2019 Seth Danner. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    // MARK: Properties
    var score: Int = 0
    var starfield: SKEmitterNode!
    var gameOverLabel: SKLabelNode!
    var scoreLabel: SKLabelNode!
    var scoreTotalLabel: SKLabelNode!
    var newGameButtonNode: SKSpriteNode!
    var difficultyButtonNode: SKSpriteNode!
    var difficultyLabelNode: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: self.frame.size.width, y: size.height)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        starfield.zPosition = -1
        
        gameOverLabel = self.childNode(withName: "gameOverLabel") as! SKLabelNode
        gameOverLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 175)
        
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 235)
        
        scoreTotalLabel = self.childNode(withName: "scoreTotalLabel") as! SKLabelNode
        scoreTotalLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 285)
        scoreTotalLabel.text = "\(score)"
        
        newGameButtonNode = self.childNode(withName: "startOverButton") as! SKSpriteNode
        newGameButtonNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 345)
        newGameButtonNode.texture = SKTexture(imageNamed: "startOverButton")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let node = self.nodes(at: location)
            
            if node[0].name == "startOverButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let menuScene = MenuScene(fileNamed: "MenuScene")!
                menuScene.scaleMode = .aspectFit
                self.view!.presentScene(menuScene, transition: transition)
            }
        }
    }
}

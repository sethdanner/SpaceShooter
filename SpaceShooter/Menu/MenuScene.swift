//
//  MenuScene.swift
//  SpaceShooter
//
//  Created by Seth Danner on 3/24/19.
//  Copyright © 2019 Seth Danner. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    // MARK: Properties
    var starfield: SKEmitterNode!
    var gameTitleLabel: SKLabelNode!
    var newGameButtonNode: SKSpriteNode!
    var difficultyButtonNode: SKSpriteNode!
    var difficultyLabelNode: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        self.scaleMode = .aspectFill
                
        starfield = SKEmitterNode(fileNamed: "Starfield")
        starfield.position = CGPoint(x: self.frame.size.width, y: size.height)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)
        starfield.zPosition = -1
        
        gameTitleLabel = self.childNode(withName: "gameTitleLabel") as! SKLabelNode
        gameTitleLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 175)
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
        newGameButtonNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 275)
        newGameButtonNode.texture = SKTexture(imageNamed: "newGameButton")
        
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as! SKSpriteNode
        difficultyButtonNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 350)
        difficultyButtonNode.texture = SKTexture(imageNamed: "difficultyButton")
        
        difficultyLabelNode = self.childNode(withName: "difficultyLabel") as! SKLabelNode
        difficultyLabelNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 450)
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "hard") {
            difficultyLabelNode.text = "Hard"
        } else {
            difficultyLabelNode.text = "Easy"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                gameScene.scaleMode = .resizeFill
                self.view!.presentScene(gameScene, transition: transition)
            } else if nodesArray.first?.name == "difficultyButton" {
                changeDifficutly()
            }
        }
    }
    
    func changeDifficutly() {
        
        let userDefaults = UserDefaults.standard
        
        if difficultyLabelNode.text == "Easy" {
            difficultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
        } else {
            difficultyLabelNode.text = "Easy"
            userDefaults.set(false, forKey: "hard")
        }
        
        userDefaults.synchronize()
    }
}

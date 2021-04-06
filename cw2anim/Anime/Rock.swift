//
//  Rock.swift
//  Anime
//
//  Created by Montypass on 06.04.2021.
//

import SpriteKit


enum RockType: String {
    case red, blue, yellow, gray
}

class Rock: SKSpriteNode {
    
    let rockType: RockType
    var grabbed = false
    var flying = false {
        didSet {
            if flying {
                physicsBody?.isDynamic = true
                animateFlight(active: true)
            } else {
                animateFlight(active: false)
            }
        }
    }
    
    
    
    func animateFlight(active: Bool) {
        if active {
            run(SKAction.repeatForever(SKAction.animate(with: flyingFrames, timePerFrame: 0.1, resize: true, restore: true)))
        } else {
            removeAllActions()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

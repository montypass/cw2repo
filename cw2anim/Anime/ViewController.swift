//
//  ViewController.swift
//  Anime
//
//  Created by Montypass on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var viewToAnimate: UIView!
    var animator: UIViewPropertyAnimator!
    var panRecognizer = UIPanGestureRecognizer()
    var pinchRecognizer = UIPinchGestureRecognizer()
    var maxScale: CGFloat = 0
    
    var rock = Rock(type: .red)
    let anchor = SKNode()
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let rockGesture = UITapGestureRecognizer
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            switch roundState {
            case .ready:
                if let touch = touches.first {
                    let location  = touch.location(in: self)
                    if rock.contains(location) {
                        panRecognizer.isEnabled = false
                        rock.grabbed = true
                        rock.position = location
                    }
                }
            case .flying:
                break
            }
        }
        
        func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                if rock.grabbed {
                    rock.position = location
                }
            }
        }
        
        func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            if rock.grabbed {
                rock.grabbed = false
                rock.flying = true
                let dx = anchor.position.x - rock.position.x
                let dy = anchor.position.y - rock.position.y
                let impulse = CGVector(dx: dx, dy: dy)
                rock.physicsBody?.applyImpulse(impulse)
                rock.isUserInteractionEnabled = false
            }
        }
        
        func setupGestureRecognizers() {
            guard let view = view else { return }
            panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan))
            view.addGestureRecognizer(panRecognizer)
            
            pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
            view.addGestureRecognizer(pinchRecognizer)
        }
        
       
        UIView.animate(withDuration: 1.8, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.repeat, animations: {
            
            self.viewToAnimate.transform = CGAffineTransform(rotationAngle: .pi)
            self.viewToAnimate.backgroundColor = .red
            self.viewToAnimate.frame.origin.x = self.view.bounds.maxX - self.viewToAnimate.frame.width
     }, completion: nil)
        
        
       

    
    
    
   
    

        }
}

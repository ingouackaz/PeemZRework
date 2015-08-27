//
//  SettingsView.swift
//  ApplicationPeemz
//
//  Created by David Ghouzi on 25/08/15.
//  Copyright (c) 2015 DGPeemz. All rights reserved.
//

import UIKit

class SettingsView: FXBlurView {

    
    
    
    var animator: UIDynamicAnimator!
    var container: UICollisionBehavior!
    var snap: UISnapBehavior!
    var dynamicItem: UIDynamicItemBehavior!
    var gravity: UIGravityBehavior!
    
    var panGestureRecognizer:UIPanGestureRecognizer!
    
    func setup() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan")
        panGestureRecognizer.cancelsTouchesInView = false
        
        self.addGestureRecognizer(panGestureRecognizer)
        
        animator = UIDynamicAnimator(referenceView: self.superview!)
        dynamicItem = UIDynamicItemBehavior(items: [self])
        dynamicItem.allowsRotation = false
        dynamicItem.elasticity = 0
        
        gravity = UIGravityBehavior(items: [self])
        gravity.gravityDirection = CGVectorMake(0, -1)
        
        container = UICollisionBehavior(items: [self])
        
        
        configureContainer()
        
        animator.addBehavior(gravity)
        animator.addBehavior(dynamicItem)
        animator.addBehavior(container)
        
    }
    
    
    func configureContainer() {
      let boundaryWidth = UIScreen.mainScreen().bounds.size.width
        container.addBoundaryWithIdentifier("upper", fromPoint: CGPointMake(0,-self.frame.size.height + 150), toPoint: CGPointMake(boundaryWidth, -self.frame.size.height + 150))
        let boundaryHeight = UIScreen.mainScreen().bounds.size.height
        container.addBoundaryWithIdentifier("lower", fromPoint: CGPointMake(0, boundaryHeight), toPoint: CGPointMake(boundaryWidth, boundaryHeight))
        
    }
    
    func handlePan(pan: UIPanGestureRecognizer) {
        let velocity = pan.velocityInView(self.superview).y
        var movement = self.frame
        movement.origin.x = 0
        movement.origin.y = movement.origin.y + (velocity * 0.5)
        if pan.state == .Ended {
            panGestureEnded()
        } else if pan.state == .Began {
             snapToBottom()
        } else {
            animator.removeBehavior(snap)
            snap = UISnapBehavior(item: self, snapToPoint: CGPointMake(CGRectGetMidX(movement), CGRectGetMidY(movement)))
            animator.addBehavior(snap)
            
            
        }
        
        
    }
    
    func panGestureEnded() {
        animator.removeBehavior(snap)
        
        let velocity = dynamicItem.linearVelocityForItem(self)
        
        if fabs(Float(velocity.y)) > 250 {
            if velocity.y < 0 {
                snapToTop()
            } else{
                snapToBottom()
            }
        } else {
            
            if let superViewHeight = self.superview?.bounds.size.height {
                if self.frame.origin.y > superViewHeight / 2 {
                        snapToBottom()
                }else{
                    snapToTop()
                }
            }
        }
    }
    
    func snapToBottom() {
        gravity.gravityDirection = CGVectorMake(0, 2.5)
    }
    
    func snapToTop() {
        gravity.gravityDirection = CGVectorMake(0, -2.5)
    }
    
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

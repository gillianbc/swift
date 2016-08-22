//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by test on 22/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    //MARK: Properties
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    //MARK: ON LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)  //the view is a property inherited from UIView
        
        //When you create an instance of a behavior, you associate it with a set of items
        //Adding gravity makes the square fall
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        
        //Add a rectangular barrier
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        //Adding a collision boundary stops the square falling off the screen or 
        //going through the barrier
        collision = UICollisionBehavior(items: [square, barrier])
        collision.collisionDelegate = self
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //to stop the barrier moving when it's collided with
        // add a boundary to the barrier that has the same frame as the barrier
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        
        //Add a bit of bounciness to the square
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        //log what's happening to the square
//        collision.action = {
//            print("\(NSStringFromCGAffineTransform(square.transform)) \(NSStringFromCGPoint(square.center))")
//        }
        
        var updateCount = 0
        collision.action = {
            if (updateCount % 5 == 0) {
                let outline = UIView(frame: square.bounds)
                outline.transform = square.transform
                outline.center = square.center
                
                outline.alpha = 0.5
                outline.backgroundColor = UIColor.clearColor()
                outline.layer.borderColor = square.layer.presentationLayer()!.backgroundColor
                outline.layer.borderWidth = 1.0
                self.view.addSubview(outline)
            }
            
            ++updateCount
        }
        
    }

    //MARK: Delegate
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint){
//        print("Collision occurred between \(item1.description) and \(item2.description)")
        let collidingView = item1 as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()}

    }
    /*
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        print("Boundary contact occurred - \(identifier)")
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
    }
 */
    
}


//
//  OvalLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
  
  let animationDuration: CFTimeInterval = 1
  
  override init() {
    super.init()
    fillColor = Colors.green.CGColor
    path = ovalPathSmall.CGPath
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 50, y: 50, width: 0.0, height: 0.0))
    }
    
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 25, y: 25, width: 50, height: 50))
    }
  
  var ovalPathSquishVertical: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 50, y: 50, width: 0, height: 0))
  }
  
  var ovalPathSquishHorizontal: UIBezierPath {
    return UIBezierPath(ovalInRect: CGRect(x: 50, y: 50, width: 50, height: 50))
  }
  
  func expand() {
    
//    let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
//    expandAnimation.fromValue = ovalPathSmall.CGPath
//    expandAnimation.toValue = ovalPathLarge.CGPath
//    expandAnimation.duration = animationDuration
//    expandAnimation.fillMode = kCAFillModeForwards
//    
//    expandAnimation.removedOnCompletion = false
    
//    let wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
//    wobbleAnimation1.fromValue = ovalPathSmall.CGPath
//    wobbleAnimation1.toValue = ovalPathLarge.CGPath
//    wobbleAnimation1.beginTime = 0.0
//    wobbleAnimation1.duration = animationDuration
//    
//    let fadeAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
//    fadeAnimation1.fromValue = 0
//    fadeAnimation1.toValue = 1
//    fadeAnimation1.duration = 1.0
//    
//    let fadeAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
//    fadeAnimation2.fromValue = 1
//    fadeAnimation2.toValue = 0
//    fadeAnimation2.duration = 1.0
//    
//    let expandAnimation: CAAnimationGroup = CAAnimationGroup()
//    expandAnimation.animations = [wobbleAnimation1 , fadeAnimation1 , fadeAnimation2 ]
//    expandAnimation.duration = fadeAnimation2.beginTime + fadeAnimation2.duration
//    expandAnimation.removedOnCompletion = false
//    addAnimation(expandAnimation, forKey: nil)
    
  }
  
    func wobble() {
        
        let wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation1.fromValue = ovalPathSmall.CGPath
        wobbleAnimation1.toValue = ovalPathLarge.CGPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        let fadeAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation1.fromValue = 0
        fadeAnimation1.toValue = 1
        fadeAnimation1.duration = 1.0
        
        let fadeAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation2.fromValue = 1
        fadeAnimation2.toValue = 0
        fadeAnimation2.duration = 1.0
        
        let wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation2.fromValue = ovalPathSmall.CGPath
        wobbleAnimation2.toValue = ovalPathLarge.CGPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration
        wobbleAnimation2.duration = animationDuration
        
        
        let wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation3.fromValue = ovalPathSquishHorizontal.CGPath
        wobbleAnimation3.toValue = ovalPathSquishVertical.CGPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration
        wobbleAnimation3.duration = animationDuration
        
        
        let wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation4.fromValue = ovalPathSquishVertical.CGPath
        wobbleAnimation4.toValue = ovalPathLarge.CGPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration
        wobbleAnimation4.duration = animationDuration
        
        
        let wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        wobbleAnimationGroup.animations = [wobbleAnimation1 , fadeAnimation1 , fadeAnimation2 ]
        wobbleAnimationGroup.duration = fadeAnimation2.beginTime + fadeAnimation2.duration
        wobbleAnimationGroup.repeatCount = 20
        addAnimation(wobbleAnimationGroup, forKey: nil)
    }
  
  func contract() {
    
  }
}

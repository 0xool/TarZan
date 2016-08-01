//
//  RecpieDetailVCAnimation.swift
//  SanatSharif
//
//  Created by cyrus refahi on 7/26/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class RecpieDetailVCAnimationDissmiss: NSObject , UIViewControllerAnimatedTransitioning {
    
    var destinationFrame = CGRect.zero
    
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
                
        // 1
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        // 2
        let finalFrame = destinationFrame
        
        // 3
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        //snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        fromVC.view.hidden = true
        
        perspectiveTransformForContainerView(containerView)
        //        snapshot.layer.transform = yRotation(M_PI_2)
        snapshot.alpha = 1
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                // 2
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: {
//                     fromVC.view.layer.transform = self.yRotation(-M_PI_2)
                        toVC.view.alpha = 1
//                    fromVC.view.alpha = 0
//                    snapshot.alpha = 0
                })
                
                
                
                // 4
                UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                    snapshot.frame = finalFrame
                })
            },
            completion: { _ in
                // 5
                toVC.view.hidden = false
                //                fromVC.view.layer.transform = self.yRotation(0.0)
                fromVC.view.alpha = 1
                fromVC.view.hidden = true
                
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }
    
    func yRotation(angle: Double) -> CATransform3D {
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }
    
    func perspectiveTransformForContainerView(containerView: UIView) {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
    
    
}

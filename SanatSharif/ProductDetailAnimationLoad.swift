//
//  ProductDetailAnimationLoad.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/27/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//


import UIKit

class ProductDetailAnimation: NSObject , UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRect.zero
    var originTransform = CGRect.infinite
    
    
    
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
        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        
        // 3
        let snapshot = toVC.view.snapshotViewAfterScreenUpdates(true)
        snapshot.frame = initialFrame
        snapshot.layer.masksToBounds = true
        
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.hidden = true
        
        perspectiveTransformForContainerView(containerView)
        //        snapshot.layer.transform = yRotation(M_PI_2)
        
        snapshot.transform = CGAffineTransformMakeScale(0, 0)
        
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                // 2
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: {
                    //                    fromVC.view.layer.transform = self.yRotation(-M_PI_2)
                    fromVC.view.alpha = 1
                    snapshot.transform = CGAffineTransformMakeScale(1, 1)
                    
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
                //                fromVC.view.alpha = 0
                
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

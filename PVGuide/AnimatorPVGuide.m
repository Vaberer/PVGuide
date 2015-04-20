//
//  AnimatorProVersion.m
//  Smart Record
//
//  Created by Patrik Vaberer on 4/4/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "AnimatorPVGuide.h"

@interface AnimatorPVGuide()
@property BOOL show;

@end

@implementation AnimatorPVGuide

- (instancetype)initWithShow:(BOOL)show {
    
    self = [super init];
    if (self) {
        self.show = show;
    }
    return self;
    
    
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    
    
    
    CGRect endPos;
    CGRect startPos;
    
    if (self.show) {
        endPos = toViewController.view.frame;
        startPos = toViewController.view.frame;
        startPos.origin.x =  - startPos.size.width;
        toViewController.view.frame = startPos;
        // toViewController.view.alpha = 0;
        
        //[containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        [containerView  addSubview:toViewController.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            
            
            
            
            toViewController.view.frame = endPos;
            
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        
        startPos = [transitionContext initialFrameForViewController:fromViewController];
        
        endPos = [transitionContext finalFrameForViewController:fromViewController];
        endPos.origin.x =  - endPos.size.width;
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            fromViewController.view.frame = endPos;
            fromViewController.view.alpha = 0;
            
            
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    
    
    
    

}


@end

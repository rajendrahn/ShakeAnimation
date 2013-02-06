//
//  UIView+ShakeAnimation.m
//  ShakeAnimation
//
//  Created by Rajendra HN on 06/02/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "UIView+ShakeAnimation.h"
#include <QuartzCore/QuartzCore.h>

const CGFloat kInitailDistnce = 15;
const CGFloat kDecrement = 5;

CGPoint pointByAddingXToPoint(CGPoint point, CGFloat x)
{
    return CGPointMake(point.x + x, point.y);
}

@implementation UIView (ShakeAnimation)

- (void)incorrectPasswordShakeAnimationWithCompletionBlock:(void (^)(void))completionBlock
{
    //create the path for shake
    CGPoint center = self.center;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.center];
    
    // keep shaking until u hit 0
    for (CGFloat distace = kInitailDistnce; distace > 0; distace -= kDecrement)
    {
        [path addLineToPoint:pointByAddingXToPoint(center, distace)];
        [path addLineToPoint:center];
        [path addLineToPoint:pointByAddingXToPoint(center, -distace)];
    }
    
    //create the CAKeyframeAnimation with the path created and animate
    CAKeyframeAnimation *pathAnimtion = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimtion.path = path.CGPath;
    pathAnimtion.duration = 0.3;
    [self.layer addAnimation:pathAnimtion forKey:@"shake"];
}

- (void)startAppDeleteShakeAnimation
{
    
}

- (void)stopAppDeleteShakeAnimation
{
    
}

- (BOOL)appDeleteShakeAnimationInProgress
{
    return NO;
}

@end

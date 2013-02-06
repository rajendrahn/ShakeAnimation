//
//  UIView+ShakeAnimation.m
//  ShakeAnimation
//
//  Created by Rajendra HN on 06/02/13.
//
#import <QuartzCore/QuartzCore.h>
#import "UIView+ShakeAnimation.h"

const CGFloat kInitailDistnce = 15;
const CGFloat kDecrement = 5;

CGPoint pointByAddingXToPoint(CGPoint point, CGFloat x)
{
    return CGPointMake(point.x + x, point.y);
}

CGFloat degreeToRadian(CGFloat degree)
{
    return degree * M_PI / 180;
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
    if (completionBlock)
    {
        int64_t delayInSeconds = 0.3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), completionBlock);
    }
}

- (void)startAppDeleteShakeAnimation
{
    CABasicAnimation *appDeleteShakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    appDeleteShakeAnimation.autoreverses = YES;
    appDeleteShakeAnimation.repeatDuration = HUGE_VALF;
    appDeleteShakeAnimation.duration = 0.08;
    appDeleteShakeAnimation.fromValue = [NSNumber numberWithFloat:-degreeToRadian(2)];
    appDeleteShakeAnimation.toValue=[NSNumber numberWithFloat:degreeToRadian(2)];
    [self.layer addAnimation:appDeleteShakeAnimation forKey:@"appDeleteShakeAnimation"];
}

- (void)stopAppDeleteShakeAnimation
{
    [self.layer removeAnimationForKey:@"appDeleteShakeAnimation"];
}

@end

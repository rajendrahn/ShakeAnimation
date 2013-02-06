//
//  UIView+ShakeAnimation.h
//  ShakeAnimation
//
//  Created by Rajendra HN on 06/02/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShakeAnimation)

//performs the Apple's shake animation of incorrect password.
- (void)incorrectPasswordShakeAnimationWithCompletionBlock:(void (^)(void))completionBlock;

//performs the Apple's shake animation that happens when you long press an app icon.
- (void)startAppDeleteShakeAnimation;
- (void)stopAppDeleteShakeAnimation;

@end

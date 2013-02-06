//
//  ViewController.m
//  ShakeAnimation
//
//  Created by Rajendra HN on 06/02/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ShakeAnimation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@property (weak, nonatomic) IBOutlet UIButton *appIconShakeAnimationStart;

@property (weak, nonatomic) IBOutlet UITextField *invalidPasswordTextbox;
@property (weak, nonatomic) IBOutlet UIButton *invalidPasswordAnimationStart;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)appIconShakeAnimationStartOrStop:(id)sender
{
    if([_appIconImageView appDeleteShakeAnimationInProgress])
    {
        [_appIconImageView stopAppDeleteShakeAnimation];
    }
    else
    {
        [_appIconImageView startAppDeleteShakeAnimation];
    }
}

- (IBAction)incorrectPasswordAnimationStart:(id)sender
{
    [_invalidPasswordTextbox incorrectPasswordShakeAnimationWithCompletionBlock:^{
        NSLog(@"incorrectPasswordShakeAnimation Completed");
    }];
}
@end

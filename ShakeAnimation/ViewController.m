//
//  ViewController.m
//  ShakeAnimation
//
//  Created by Rajendra HN on 06/02/13.
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

- (IBAction)appIconShakeAnimationStart:(id)sender
{
    [_appIconImageView startAppDeleteShakeAnimation];
}

- (IBAction)shakeStop:(id)sender
{
    [_appIconImageView stopAppDeleteShakeAnimation];
}

- (IBAction)incorrectPasswordAnimationStart:(id)sender
{
    [_invalidPasswordTextbox incorrectPasswordShakeAnimationWithCompletionBlock:^{
        NSLog(@"incorrectPasswordShakeAnimation Completed");
    }];
}
@end

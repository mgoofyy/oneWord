//
//  GFHomeContentViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHomeContentViewController.h"
#import "AppDelegate.h"


@implementation GFHomeContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setLaunchAnimation];
}

- (void)setLaunchAnimation {
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"launchStoryboard"];
    
    UIView *launchView = viewController.view;
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    UIWindow *mainWindow = delegate.window;
    [mainWindow addSubview:launchView];
    
    [UIView animateWithDuration:0.6f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.x = -SCREEN_WIDTH;
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
    }];
}

@end

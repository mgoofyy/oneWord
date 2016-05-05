//
//  GFTabBarViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFTabBarViewController.h"
#import "GFHomeContentViewController.h"

@implementation GFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setChildViewController];
}

- (void)setChildViewController {
    GFHomeContentViewController *homeVC = [[GFHomeContentViewController alloc] init];
    homeVC.tabBarItem.title = @"内容";
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    [self addChildViewController:nav];
}

- (void)viewWillLayoutSubviews {
    self.tabBar.height = 30.f;
    self.tabBar.y = [UIScreen mainScreen].bounds.size.height - 30;
}

@end

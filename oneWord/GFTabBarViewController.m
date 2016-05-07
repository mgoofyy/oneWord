//
//  GFTabBarViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFTabBarViewController.h"
#import "GFHomeContentViewController.h"
#import "GFContentSortViewController.h"

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
    
    GFContentSortViewController *contentVC = [[GFContentSortViewController alloc] init];
    homeVC.tabBarItem.title = @"内容";
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:contentVC];
    [self addChildViewController:nav2];
}

- (void)viewWillLayoutSubviews {
    self.tabBar.height = 35.f;
    self.tabBar.y = [UIScreen mainScreen].bounds.size.height - 35;
}

@end

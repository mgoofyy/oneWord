//
//  GFTabBarViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFTabBarViewController.h"
#import "GFHomeContentViewController.h"
#import "GFContentSortTableViewController.h"
#import "UIImage+GFImage.h"
#import "GFNavigationController.h"
#import "GFTabBar.h"
#import "GFMessageViewController.h"
#import "GFMeViewController.h"
#import "AppDelegate.h"

@interface GFTabBarViewController()

@property (nonatomic,strong) NSMutableArray *tabBarItem;

@property (nonatomic, weak) GFHomeContentViewController *home;

@end

@implementation GFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setChildViewController];

    
    GFTabBar *tabBar = [[GFTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKey:@"tabBar"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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

- (void)setChildViewController {
        //首页
        GFHomeContentViewController *home = [[GFHomeContentViewController alloc]init];
        _home = home;
        [self setTabBarItem:home image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"首页"];
        
        GFContentSortTableViewController *contentSortVC = [[GFContentSortTableViewController alloc]init];
        [self setTabBarItem:contentSortVC image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_highlighted" title:@"消息"];
        
        GFMessageViewController *messageViewController = [[GFMessageViewController alloc]init];
        [self setTabBarItem:messageViewController image:@"tabbar_discover" selectedImage:@"tabbar_discover_highlighted" title:@"发现"];
        
        GFMeViewController *meViewController = [[GFMeViewController alloc]init];
        [self setTabBarItem:meViewController image:@"tabbar_profile" selectedImage:@"tabbar_profile_highlighted" title:@"我"];
    
}

- (void)viewWillLayoutSubviews {
    self.tabBar.height = 40.f;
    self.tabBar.y = [UIScreen mainScreen].bounds.size.height - 40;
}

-(void)setTabBarItem:(UIViewController *)viewController image:(NSString *)imageName selectedImage:(NSString *)selectImageName title:(NSString *)title {
    
    viewController.tabBarItem.image = [UIImage imageWithOriginImage:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithOriginImage:selectImageName];
    GFNavigationController *nav = [[GFNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
    [self.tabBarItem addObject:viewController];
}

@end

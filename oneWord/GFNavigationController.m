//
//  GFNavigationController.m
//  GFSinaWeiBo
//
//  Created by goofygao on 15/12/16.
//  Copyright © 2015年 goofyy. All rights reserved.
//

#import "GFNavigationController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"

@interface GFNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic,strong) id popGestureRecognizerDelegate;

@end

@implementation GFNavigationController


+ (void)initialize
{
    if (self == [super class]) {
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
        item.tintColor = [UIColor orangeColor];
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"%s",__func__);
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchDown];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchDown];
    }
    [super pushViewController:viewController animated:animated];
    
    
}

#pragma delegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate =_popGestureRecognizerDelegate;
    } else {
        _popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
        self.interactivePopGestureRecognizer.delegate = nil;

    }
}



#pragma action 

-(void)backToPre {
    [self popViewControllerAnimated:YES];
}

-(void)backToRoot {
    [self popToRootViewControllerAnimated:true];
}
@end

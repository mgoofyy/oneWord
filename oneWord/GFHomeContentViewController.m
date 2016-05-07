//
//  GFHomeContentViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHomeContentViewController.h"


@implementation GFHomeContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 200, 100)];
    imageview.contentMode = UIViewContentModeScaleAspectFill;
   imageview.cornerRadius = 15.0f;
    imageview.image = [UIImage imageNamed:@"1.png"];
    
    [self.view addSubview:imageview];
}

@end

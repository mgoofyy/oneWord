//
//  GFHomeContentViewController.m
//  oneWord
//
//  Created by goofygao on 5/5/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFHomeContentViewController.h"
#import "AppDelegate.h"
#import "GFHomeContentCollectionViewCell.h"

@interface GFHomeContentViewController()
/**
 *  顶部首页大图
 */
@property (nonatomic, strong) UIImageView *topImgeView;
/**
 *  顶部大图下的类别的collectionView
 */
@property (nonatomic,  strong) UICollectionView *sortContentView;

@end


@implementation GFHomeContentViewController


#pragma mark - lazy Load

- (UIImageView *)topImgeView {
    if (!_topImgeView) {
        _topImgeView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), SCREEN_WIDTH, 100)];
    }
    return _topImgeView;
}

- (UICollectionView *)sortContentView {
    if (!_sortContentView) {
        _sortContentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topImgeView.frame) + 10, SCREEN_WIDTH, SCREEN_HEIGHT - 100 - CGRectGetMaxY(self.navigationController.navigationBar.frame))];
        [_sortContentView registerNib:[UINib nibWithNibName:@"GFHomeContentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionViewCell"];
    }
    return _sortContentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [[GFHTTPManger rac_login:@"/topics" params:@{}] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}


#pragma mark - initView

- (void)initView {
    self.view.backgroundColor = [UIColor redColor];
}

#pragma mark - function



#pragma mark - delegate




#pragma mark - action




@end

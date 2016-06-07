//
//  GFContentSortViewController.m
//  oneWord
//
//  Created by goofygao on 5/6/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFContentSortTableViewController.h"
#import "GFContentSortCell.h"

@interface GFContentSortTableViewController ()

@end

@implementation GFContentSortTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init View 

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"GFContentSortCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableViewDelegate - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GFContentSortCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    @weakify(self)
    [[[cell.shareButtonCommand.executionSignals
    takeUntil:cell.rac_prepareForReuseSignal]
    switchToLatest]
    subscribeNext:^(id x) {
//        @strongify(self)
        NSLog(@"%zd",indexPath.row);
//        [self requestToDeletePhrase:phrase.phrase];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

@end

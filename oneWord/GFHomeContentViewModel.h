//
//  GFHomeContentViewModel.h
//  oneWord
//
//  Created by goofygao on 5/12/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFHomeContentViewModel : NSObject

//@property (nonatomic, strong) RACSignal *
/**
 *  记录新的数据是否刷新
 */
@property (nonatomic, assign, readonly) BOOL shouldReloadData;
/**
 *  请求到的新的数据
 */
@property (nonatomic, copy, readonly) NSArray *displayData;

@end

//
//  GFContentSortCell.h
//  oneWord
//
//  Created by goofygao on 6/7/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFContentSortCell : UITableViewCell

@property (nonatomic, strong, readonly) RACCommand *shareButtonCommand;
@property (nonatomic, strong, readonly) RACCommand *likeButtonCommand;

@end

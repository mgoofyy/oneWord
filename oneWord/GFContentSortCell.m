//
//  GFContentSortCell.m
//  oneWord
//
//  Created by goofygao on 6/7/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import "GFContentSortCell.h"

@interface GFContentSortCell()
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (nonatomic, strong, readwrite) RACCommand *shareButtonCommand;
@property (nonatomic, strong, readwrite) RACCommand *likeButtonCommand;


@end

@implementation GFContentSortCell

- (RACCommand *)shareButtonCommand {
    if (!_shareButtonCommand) {
        _shareButtonCommand = self.shareButton.rac_command;
    }
    return _shareButtonCommand;
}

- (RACCommand *)likeButtonCommand {
    if (!_likeButtonCommand) {
        _likeButtonCommand = self.likeButton.rac_command;
    }
    return _likeButtonCommand;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.shareButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal return:input];
    }];
    
    self.likeButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal return:input];
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  PushCell.m
//  runner
//
//  Created by runner on 2019/11/12.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PushCell.h"

@implementation PushCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.hideArrow = NO;
    self.contentView.backgroundColor = FAFAFA;
}

- (void)setHideArrow:(BOOL)hideArrow {
    _hideArrow = hideArrow;
    self.arrow_width.constant = _hideArrow ? 0.0 : 8.0;
    self.value_right_space.constant = _hideArrow ? 0.0 : 8.0;
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

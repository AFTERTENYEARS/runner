//
//  PlaceHolderCell.m
//  runner
//
//  Created by runner on 2019/10/23.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PlaceHolderCell.h"

@implementation PlaceHolderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.controlButton.layer.borderWidth = 0.5f;
    self.controlButton.layer.cornerRadius = 5.0f;
    self.controlButton.layer.borderColor = E94F4f.CGColor;
}

- (IBAction)controlButtonClicked:(id)sender {
    if (self.callback) {
        self.callback();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

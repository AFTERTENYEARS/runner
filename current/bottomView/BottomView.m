//
//  BottomView.m
//  runner
//
//  Created by runner on 2019/10/23.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.controlButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (IBAction)control:(id)sender {
    if (self.clickFunc) {
        self.clickFunc();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

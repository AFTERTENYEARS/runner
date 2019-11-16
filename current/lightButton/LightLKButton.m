//
//  LightLKButton.m
//  runner
//
//  Created by runner on 2019/10/24.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LightLKButton.h"

@implementation LightLKButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.0f;
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = E94F4f.CGColor;
    
    [self customNormalColor:[UIColor clearColor] highLightedColor:COLOR(@"E8495B") disabledColor:COLOR(@"F98794") titleNormalColor:COLOR(@"E8495B") titleHilightedColor:COLOR(@"FAFAFA")];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

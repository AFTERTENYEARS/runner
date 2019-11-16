//
//  DeepLKButton.m
//  runner
//
//  Created by runner on 2019/10/24.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "DeepLKButton.h"

@implementation DeepLKButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    //self.layer.cornerRadius = 5.0f;
    
    [self customNormalColor:COLOR(@"E8495B") highLightedColor:COLOR(@"C93E4F") disabledColor:COLOR(@"F98794") titleNormalColor:COLOR(@"FAFAFA") titleHilightedColor:COLOR(@"FAFAFA")];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

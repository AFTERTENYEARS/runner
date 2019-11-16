//
//  LKClickView.m
//  runner
//
//  Created by runner on 2019/10/22.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKClickView.h"

@implementation LKClickView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isClicked = NO;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.isClicked = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (!self.isClicked) {
        self.isClicked = YES;
        [UIView animateWithDuration:0.1 animations:^{
            self.alpha = 0.6;
            for (UIView * view in self.subviews) {
                view.alpha = 0.6;
            }
        }];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if (self.clickCallBack) {
            self.clickCallBack();
        }
        self.isClicked = NO;
        [UIView animateWithDuration:0.1 animations:^{
            self.alpha = 1.0;
            for (UIView * view in self.subviews) {
                view.alpha = 1.0;
            }
        }];
    });
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        self.alpha = 1.0;
        for (UIView * view in self.subviews) {
            view.alpha = 1.0;
        }
    });
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

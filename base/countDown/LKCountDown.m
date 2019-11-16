//
//  LKCountDown.m
//  runner
//
//  Created by runner on 2019/9/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKCountDown.h"

@interface LKCountDown ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger time;

@property (nonatomic, assign) NSInteger leftTime;

@property (nonatomic, strong) NSString *describe;

@property (nonatomic, strong) NSString *again;

@property (nonatomic, strong) UIColor *deepColor;

@property (nonatomic, strong) UIColor *lightColor;

@property (nonatomic, copy) ExcuteFunc excuteFunc;

@end

@implementation LKCountDown

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(selfClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.deepColor = COLOR(@"FAFAFA");
        self.lightColor = COLOR(@"FAFAFA");
        [self setTitleColor:self.deepColor forState:UIControlStateNormal];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addTarget:self action:@selector(selfClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.deepColor = COLOR(@"FAFAFA");
    self.lightColor = COLOR(@"FAFAFA");
    [self setTitleColor:self.deepColor forState:UIControlStateNormal];
}

- (void)customTitle:(NSString *)title time:(NSInteger)time describe:(NSString *)describe again:(nonnull NSString *)again excuteFunc:(ExcuteFunc)excuteFunc{
    
    self.titleLabel.text = title;
    [self setTitle:title forState:UIControlStateNormal];
    self.time = time;
    self.leftTime = time;
    self.describe = describe;
    self.again = again;
    self.excuteFunc = excuteFunc;
}

- (void)selfClicked:(UIButton *)sender {
    if (self.excuteFunc) {
        self.excuteFunc();
    }
}

- (void)countDown {
    NSTimeInterval seconds = self.time;
    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:seconds];// 最后期限
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_source_t _sometimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0,0, queue);
    dispatch_source_set_timer(_sometimer, dispatch_walltime(NULL,0),1.0*NSEC_PER_SEC,0);// 每秒执行一次
    dispatch_source_set_event_handler(_sometimer, ^{
        int interval = [endTime timeIntervalSinceNow];
        if(interval >0) {// 更新倒计时
            NSString *timeStr = [NSString stringWithFormat:@"%ds%@", interval,self.describe];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.titleLabel.text = timeStr;
                [self setTitle:timeStr forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                self.alpha = 0.4;
                [self setTitleColor:self.lightColor forState:UIControlStateNormal];
                [self setBackgroundImage:[self createImageWithColor:self.disabledColor] forState: UIControlStateNormal];
            });
        }else{
            // 倒计时结束，关闭
            dispatch_source_cancel(_sometimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:self.again forState:UIControlStateNormal];
                [self setTitleColor:self.deepColor forState:UIControlStateNormal];
                [self setBackgroundImage:[self createImageWithColor:self.normalColor] forState: UIControlStateNormal];
                self.userInteractionEnabled =YES;
                self.alpha = 1.0;
            });
        }
    });
    dispatch_resume(_sometimer);
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 10, 10);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  SKAlertView.m
//  kkiou
//
//  Created by mac book pro on 2018/4/10.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

#import "LKAlertView.h"

#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height

@implementation LKAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self addSubview:self.alertWrapper];
        [self.alertWrapper addSubview:self.titlelabel];
        [self.alertWrapper addSubview:self.messageLabel];
        [self.alertWrapper addSubview:self.horizontalLine];
        [self.alertWrapper addSubview:self.verticalLine];
        [self.alertWrapper addSubview:self.leftButton];
        [self.alertWrapper addSubview:self.rightButton];
    }
    return self;
}

+ (void)alertTitle:(NSString * _Nonnull)title
                   msg:(NSString *_Nonnull)msg
                  l:(NSString * _Nonnull)left
          lcb:(AlertActionCallback _Nonnull)leftCallback
                 r:(NSString * _Nonnull)right
         rcb:(AlertActionCallback _Nonnull)rightCallback {
    LKAlertView *alertView = [[LKAlertView alloc] init];
    [alertView putUpWithTitle:title message:msg leftButton:left leftCallback:leftCallback rightButton:right rightCallback:rightCallback];
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

- (void)putUpWithTitle:(NSString * _Nonnull)title message:(NSString * _Nonnull)message leftButton:(NSString * _Nonnull)leftButton leftCallback:(AlertActionCallback _Nonnull)leftCallback rightButton:(NSString * _Nonnull)rightButton rightCallback:(AlertActionCallback _Nonnull)rightCallback{
    self.alertWrapper.hidden = YES;

    //预设wrapper
    self.alertWrapper.frame = CGRectMake(47.5, (SCREEN_HEIGHT - 168.0) / 2.0, SCREEN_WIDTH - 47.5 * 2, 168.0);

    //计算messge高度
    CGSize messageSize = [message boundingRectWithSize:CGSizeMake(self.alertWrapper.frame.size.width - 70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;

    //设置wrapper frame
    CGFloat wrapperHeight = 20.0 + 35.0 + 5.0 + messageSize.height + 15.0 + 50.0;
    self.alertWrapper.frame = CGRectMake(47.5, (SCREEN_HEIGHT - wrapperHeight) / 2.0, SCREEN_WIDTH - 47.5 * 2, wrapperHeight);

    //设置title
    self.titlelabel.frame = CGRectMake(0, 20.0, self.alertWrapper.frame.size.width, 35.0);
    self.titlelabel.text = title;

    //设置message
    self.messageLabel.frame = CGRectMake(35.0, 20.0 + 35.0 + 5.0, self.alertWrapper.frame.size.width - 35.0 - 35.0, messageSize.height);
    self.messageLabel.text = message;

    //设置横线
    self.horizontalLine.frame = CGRectMake(0, self.alertWrapper.frame.size.height - 50.0, self.alertWrapper.frame.size.width, 0.5);
    //设置竖线
    self.verticalLine.frame = CGRectMake(self.alertWrapper.frame.size.width / 2.0, self.alertWrapper.frame.size.height - 49.5, 0.5, 49.5);

    //设置左按钮
    self.leftButton.frame = CGRectMake(0, self.alertWrapper.frame.size.height - 49.5, self.alertWrapper.frame.size.width / 2.0 - 0.5, 49.5);
    [self.leftButton setTitle:leftButton forState:UIControlStateNormal];
    self.leftCallback = leftCallback;

    //设置右按钮
    self.rightButton.frame = CGRectMake(self.alertWrapper.frame.size.width / 2.0 + 0.5, self.alertWrapper.frame.size.height - 49.5, self.alertWrapper.frame.size.width / 2.0 - 0.5, 49.5);
    [self.rightButton setTitle:rightButton forState:UIControlStateNormal];
    self.rightCallback = rightCallback;

    self.alertWrapper.hidden = NO;

    // 先缩小
    self.alertWrapper.transform = CGAffineTransformMakeScale(0.8, 0.8);

    // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
    [UIView animateWithDuration: 0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.3 options:0 animations:^{
        // 放大
        self.alertWrapper.transform = CGAffineTransformMakeScale(1, 1);
    } completion:nil];
}

- (void)leftButtonClicked:(UIButton *)leftButton{
    [self removeFromSuperview];
    self.leftCallback();
}

- (void)rightButtonClicked:(UIButton *)rightButton{
    [self removeFromSuperview];
    self.rightCallback();
}


#pragma mark - lazyLoad
- (UIView *)alertWrapper{
    if (_alertWrapper) {
        return _alertWrapper;
    }
    _alertWrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _alertWrapper.backgroundColor = [UIColor whiteColor];
    _alertWrapper.layer.masksToBounds = YES;
    _alertWrapper.layer.cornerRadius = 4.0f;

    return _alertWrapper;
}

- (UILabel *)titlelabel{
    if (_titlelabel) {
        return _titlelabel;
    }

    _titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _titlelabel.font = [UIFont systemFontOfSize:18];
    _titlelabel.textColor = [UIColor colorWithRed:49.0 / 255.0 green:56.0 / 255.0 blue:63.0 / 255.0 alpha:1];
    _titlelabel.textAlignment = NSTextAlignmentCenter;
    return _titlelabel;
}

- (UILabel *)messageLabel{
    if (_messageLabel) {
        return _messageLabel;
    }

    _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _messageLabel.font = [UIFont systemFontOfSize:15];
    _messageLabel.textColor = [UIColor colorWithRed:165.0 / 255.0 green:171.0 / 255.0 blue:180.0 / 255.0 alpha:1];
    _messageLabel.textAlignment = 1;
    _messageLabel.numberOfLines = 0;
    return _messageLabel;
}

- (UIView *)horizontalLine{
    if (_horizontalLine) {
        return _horizontalLine;
    }

    _horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _horizontalLine.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    return _horizontalLine;
}

- (UIView *)verticalLine{
    if (_verticalLine) {
        return _verticalLine;
    }

    _verticalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _verticalLine.backgroundColor = [UIColor colorWithRed:242.0 / 255.0 green:242.0 / 255.0 blue:242.0 / 255.0 alpha:1];
    return _verticalLine;
}

- (UIButton *)leftButton{
    if (_leftButton) {
        return _leftButton;
    }
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, 0, 1, 1);
    [_leftButton setTitleColor:[UIColor colorWithRed:146.0 / 255.0 green:154.0 / 255.0 blue:165.0 / 255.0 alpha:1] forState:UIControlStateNormal];
    //[_leftButton setBackgroundImage:[UIImage imageNamed:@"button_white_default"] forState:UIControlStateNormal];
    [_leftButton setBackgroundImage:[self imageWithColor:COLOR(@"e5e5e5") size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    [_leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return _leftButton;
}

- (UIButton *)rightButton{
    if (_rightButton) {
        return _rightButton;
    }
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 1, 1);
    [_rightButton setTitleColor:[UIColor colorWithRed:73.0 / 255.0 green:161.0 / 255.0 blue:219.0 / 255.0 alpha:1] forState:UIControlStateNormal];
//    [_rightButton setBackgroundImage:[UIImage imageNamed:@"button_white_default"] forState:UIControlStateNormal];
    [_rightButton setBackgroundImage:[self imageWithColor:COLOR(@"e5e5e5") size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    [_rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return _rightButton;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
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

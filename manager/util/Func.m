//
//  Func.m
//  runner
//
//  Created by runner on 2019/9/6.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "Func.h"
#import "TabbarPage.h"

@implementation Func

+ (NSString *)string_by_timestamp:(double)timestamp {
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeString = [formatter stringFromDate:date];
    return timeString;
}

+ (UIViewController * _Nullable)currentVC{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

+ (void)toast:(NSString *_Nullable)msg{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    label.textColor = [UIColor whiteColor];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 2.0f;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.text = msg;
    
    CGSize size = [msg boundingRectWithSize:CGSizeMake(window.bounds.size.width - 48, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size;
    label.frame = CGRectMake((window.bounds.size.width - size.width) / 2 - 12, (window.bounds.size.height - size.height) / 2 - 12, size.width + 24, size.height + 24);
    [window addSubview:label];
    DELAY_EXECUTE(3, [label removeFromSuperview]);
}

+ (LKNav *)navByTitle:(NSString *)title {
    LKNav *nav = [LKNav backStyleWithTitle:@""];
    nav.backgroundColor = COLOR(@"fafafa");
    [nav.backItem setTitle:@"" forState:UIControlStateNormal];
    [nav.backItem setImage:Image_By_Name(@"current-back-red") forState:UIControlStateNormal];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, Status_Bar_Height, Screen_Width - 42 * 2, Nav_Bar_Height)];
    titleLabel.textColor = E94F4f;
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.text = title;
    [nav addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, nav.height - 0.5, nav.width, 0.5)];
    lineView.backgroundColor = E5E5E5;
    [nav addSubview:lineView];
    
    LKButton *back = [[LKButton alloc] initWithFrame:CGRectMake(nav.backItem.x, nav.backItem.y, 200, nav.backItem.height)];
    back.click = ^{
        [[Func currentVC].navigationController popViewControllerAnimated:YES];
    };
    [nav addSubview:back];
    
    return nav;
}

+ (LKNav *)redNavByTitle:(NSString *)title {
    LKNav *nav = [LKNav backStyleWithTitle:@""];
    nav.backgroundColor = E94F4F;
    [nav.backItem setTitle:@"" forState:UIControlStateNormal];
    [nav.backItem setImage:Image_By_Name(@"current-back-white") forState:UIControlStateNormal];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, Status_Bar_Height, Screen_Width - 42 * 2, Nav_Bar_Height)];
    titleLabel.textColor = FAFAFA;
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.text = title;
    [nav addSubview:titleLabel];
    
    LKButton *back = [[LKButton alloc] initWithFrame:CGRectMake(nav.backItem.x, nav.backItem.y, 200, nav.backItem.height)];
    back.click = ^{
        [[Func currentVC].navigationController popViewControllerAnimated:YES];
    };
    [nav addSubview:back];
    
    return nav;
}

+ (UIView *)maskView {
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    maskView.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0.0);
    [[UIApplication sharedApplication].keyWindow addSubview:maskView];
    
    [UIView animateWithDuration:0.2 animations:^{
        maskView.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0.3);
    }];
    
    UITapGestureRecognizer *maskViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewDiss:)];
    [maskView addGestureRecognizer:maskViewGesture];
    
    return maskView;
}

+ (void)maskViewDiss: (UITapGestureRecognizer *)maskViewGesture {
    [maskViewGesture.view removeFromSuperview];
}

+ (UIView *)topTriangleViewWithPoint:(CGPoint)point width:(CGFloat)width text:text {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, width - 10, 40)];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = E94F4f;
    label.text = text;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    
    CGFloat c_x = point.x;
    CGFloat c_y = point.y;
    CGFloat c_w = Screen_Width - point.x * 2;
    CGFloat c_h = label.height + 20;
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(c_x, c_y, c_w, c_h)];
    
    //点
    CGPoint p1 = CGPointMake(0, 4.5);
    CGPoint p2 = CGPointMake(0, c_h);
    CGPoint p3 = CGPointMake(c_w, c_h);
    CGPoint p4 = CGPointMake(c_w, 4.5);
    CGPoint p5 = CGPointMake(35, 4.5);
    CGPoint p6 = CGPointMake(30.5, 0);
    CGPoint p7 = CGPointMake(26, 4.5);
    
    //path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p5];
    [path addLineToPoint:p6];
    [path addLineToPoint:p7];
    [path addLineToPoint:p1];
    [path closePath];
    
    //layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 0.5f;
    layer.strokeColor = F5C8C8.CGColor;
    layer.fillColor = F9F1F1.CGColor;
    layer.path = path.CGPath;
    
    [contentView.layer addSublayer:layer];
    
    label.frame = CGRectMake(5.5, 4.5, c_w - 10, c_h - 4.5);
    [contentView addSubview:label];
    
    return contentView;
}

//上标签
+ (UIView *)topMarkViewWithPoint:(CGPoint)point text:(NSString *)text {
    //label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 60, 40)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = E94F4F;
    label.text = text;
    [label sizeToFit];
    
    
    CGFloat w = label.width + 10;
    CGFloat h = label.height + 10;
    CGFloat x = point.x - w / 2.0;
    CGFloat y = point.y - h;
            
    //contentView
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(x, y - 4.5, w, h + 4.5);
    
    //点
    CGPoint p1 = CGPointMake(0, 0);
    CGPoint p2 = CGPointMake(0, h);
    CGPoint p3 = CGPointMake(w / 2.0 - 4.5, h);
    CGPoint p4 = CGPointMake(w / 2.0, h + 4.5);
    CGPoint p5 = CGPointMake(w / 2.0 + 4.5, h);
    CGPoint p6 = CGPointMake(w, h);
    CGPoint p7 = CGPointMake(w, 0);
    
    //path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p5];
    [path addLineToPoint:p6];
    [path addLineToPoint:p7];
    [path addLineToPoint:p1];
    [path closePath];
    
    //layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 0.5f;
    layer.strokeColor = F5C8C8.CGColor;
    layer.fillColor = F9F1F1.CGColor;
    layer.path = path.CGPath;
    
    [contentView.layer addSublayer:layer];
    
    label.frame = CGRectMake(0, 0, w, h);
    [contentView addSubview:label];
    
    return contentView;
}

+ (void)passwordPresentTexts:(NSArray *)texts Callback:(PwdCallback)callback {
    PasswordPage *passwordPage = [[PasswordPage alloc] init];
    passwordPage.pwdCallBack = callback;
    passwordPage.texts = texts;
    [[UIApplication sharedApplication].keyWindow addSubview:passwordPage];
}

+ (void)sdUrlImage:(UIImageView *)imageView url: (NSString *)url {
    [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_IMAGE_URL, url]]];
}

+ (void)switchToLoginPage {
    //[UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[FLoginPage alloc] init]];
}

+ (void)switchTarbarPage {
    //[UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[TabbarPage alloc] init]];
}

@end

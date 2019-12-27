//
//  SKLoadingView.m
//  kkiou
//
//  Created by mac book pro on 2019/4/10.
//  Copyright © 2019年 mac book pro. All rights reserved.
//

#import "LKLoadingView.h"
#import "UIView+Extension.h"
#import <SVProgressHUD.h>

NSTimer *timer;
NSInteger leftTime;
EndBlock theEndBlock;

static UIView *blockView;

@interface LKLoadingView()<CAAnimationDelegate>
@property (nonatomic,weak)UIView *round1;
@property (nonatomic,weak)UIView *round2;
@property (nonatomic,weak)UIView *round3;

@property (nonatomic,strong)UIColor *round1Color;
@property (nonatomic,strong)UIColor *round2Color;
@property (nonatomic,strong)UIColor *round3Color;

@property (nonatomic,assign)CGFloat animRepeatTime;
@property (nonatomic,assign)CGFloat animTime;


@end

@implementation LKLoadingView

//显示加载动画在指定的view上
+ (void)showLoadingWith:(UIView *)view {
    LKLoadingView *loadingView = [[LKLoadingView alloc] initWithFrame:CGRectMake(0, 0, view.width, view.height)];
    [view addSubview:loadingView];
}

+ (void)dissLoadingWith:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            [subView removeFromSuperview];
        }
    }
}

//显示加载动画在指定的window上
+ (LKLoadingView *)showLoadingWithWindow {
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    LKLoadingView *loadingView = [[LKLoadingView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    [window addSubview:loadingView];
    return loadingView;
}

+ (void)show {
    
    //[SVProgressHUD show];
    
    //[self showLoadingWithWindow];
    
//    blockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
//    [blockView addSubview:[self GIF]];
//    blockView.userInteractionEnabled = NO;
//
//    [[[UIApplication sharedApplication] keyWindow] addSubview:blockView];
    
    [LKLoadingView dismiss];
    //加载到当前view上
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!blockView) {
            blockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
            [blockView addSubview:[self GIF]];
        }
        blockView.userInteractionEnabled = NO;
        [[Func currentVC].view addSubview:blockView];
    });
        
    
}

+ (void)showBlock {
    
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD show];
    
    //[self showLoadingWithWindow];
        
//    blockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
//    blockView.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0.2);
//    [blockView addSubview:[self GIF]];
//
//    [[[UIApplication sharedApplication] keyWindow] addSubview:blockView];
    
    [LKLoadingView dismiss];
    //加载到keyWindow上屏蔽用户操作
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!blockView) {
            blockView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
            [blockView addSubview:[self GIF]];
        }
        
        blockView.backgroundColor = COLOR_ALPHA(UIColor.blackColor, 0.2);

        [[[UIApplication sharedApplication] keyWindow] addSubview:blockView];
    });
}

+ (void)dismiss {
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//    [SVProgressHUD dismiss];
//    [timer invalidate];
    
    
//        UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
//        for (UIView *view in window.subviews) {
//            if ([view isKindOfClass:[LKLoadingView class]]) {
//                [view removeFromSuperview];
//            }
//        }
    
//    [blockView removeFromSuperview];
//    blockView = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [blockView removeFromSuperview];
        blockView = nil;
    });
}

+ (void)showCountDown:(NSInteger)time block:(BOOL)block endCallBack:(EndBlock)endBlock {
    leftTime = time;
    theEndBlock = [endBlock copy];
    if (block) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
    [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%ld", (long)leftTime]];
    
    timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

+ (void)updateTime {
    leftTime -= 1;
    [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%ld", (long)leftTime]];
    
    if (leftTime <= 0) {
        [LKLoadingView dismiss];
        if (theEndBlock) {
            theEndBlock();
            theEndBlock = nil;
        }
    }
}



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self)
    {
        _round1Color = [UIColor colorWithRed:115/255.0 green:183/255.0 blue:227/255.0 alpha:1.0];
        _round2Color = [UIColor colorWithRed:115/255.0 green:183/255.0 blue:227/255.0 alpha:0.6];
        _round3Color = [UIColor colorWithRed:115/255.0 green:183/255.0 blue:227/255.0 alpha:0.3];
        
        _animTime = 1.5;
        _animRepeatTime = 50;
        
        //宽高都是10
        CGFloat width = 10;
        UIView *round1 = [[UIView alloc] init];
        round1.width = width;
        round1.height = width;
        round1.backgroundColor = _round1Color;
        round1.layer.cornerRadius = round1.height / 2;

        
        UIView *round2 = [[UIView alloc] init];
        round2.width = width;
        round2.height = width;
        round2.backgroundColor = _round2Color;
        round2.layer.cornerRadius = round2.height / 2;
        
        
        UIView *round3 = [[UIView alloc] init];
        round3.width = width;
        round3.height = width;
        round3.backgroundColor = _round2Color;
        round3.layer.cornerRadius = round2.height / 2;
        
        [self addSubview:round1];
        [self addSubview:round2];
        [self addSubview:round3];
        
        round2.centerX = self.centerX;
        round2.centerY = self.centerY;
        
        round1.centerX = round2.centerX - 20;
        round1.centerY = round2.centerY - 20;
        
        round3.centerX = round2.centerX + 20;
        round3.centerY = round3.centerY;
        
        
        _round1 = round1;
        _round2 = round2;
        _round3 = round3;
        
        
        [self startAnim];
        
    }
    
    return self;
}


- (void)startAnim {
    CGPoint otherRoundCenter1 = CGPointMake(_round1.centerX+10, _round2.centerY);
    CGPoint otherRoundCenter2 = CGPointMake(_round2.centerX+10, _round2.centerY);
    //圆1的路径
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [path1 addArcWithCenter:otherRoundCenter1 radius:10 startAngle:-M_PI endAngle:0 clockwise:true];
    UIBezierPath *path1_1 = [[UIBezierPath alloc] init];
    [path1_1 addArcWithCenter:otherRoundCenter2 radius:10 startAngle:-M_PI endAngle:0 clockwise:false];
    [path1 appendPath:path1_1];
    
    [self viewMovePathAnimWith:_round1 path:path1 andTime:_animTime];
    [self viewColorAnimWith:_round1 fromColor:_round1Color toColor:_round3Color andTime:_animTime];
    
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    [path2 addArcWithCenter:otherRoundCenter1 radius:10 startAngle:0 endAngle:-M_PI clockwise:true];
    [self viewMovePathAnimWith:_round2 path:path2 andTime:_animTime];
    [self viewColorAnimWith:_round2 fromColor:_round2Color toColor:_round1Color andTime:_animTime];
    
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path3 addArcWithCenter:otherRoundCenter2 radius:10 startAngle:0 endAngle:-M_PI clockwise:false];
    [self viewMovePathAnimWith:_round3 path:path3 andTime:_animTime];
    [self viewColorAnimWith:_round3 fromColor:_round3Color toColor:_round1Color andTime:_animTime];
}

///设置view的移动路线，这样抽出来因为每个圆的只有路径不一样
- (void)viewMovePathAnimWith:(UIView *)view path:(UIBezierPath *)path andTime:(CGFloat)time {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    anim.path = [path CGPath];
    anim.removedOnCompletion = false;
    anim.fillMode = kCAFillModeForwards;
    anim.calculationMode = kCAAnimationCubic;
    anim.repeatCount = _animRepeatTime;
    anim.duration = time;
    anim.autoreverses = NO;
    anim.delegate = self;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:anim forKey:@"animation"];
    
}
///设置view的颜色动画
- (void)viewColorAnimWith:(UIView *)view fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor andTime:(CGFloat)time {
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.toValue = (__bridge id _Nullable)([toColor CGColor]);
    colorAnim.fromValue = (__bridge id _Nullable)([fromColor CGColor]);
    colorAnim.duration = time;
    colorAnim.autoreverses = NO;
    colorAnim.fillMode = kCAFillModeForwards;
    colorAnim.removedOnCompletion = NO;
    colorAnim.repeatCount = _animRepeatTime;
    [view.layer addAnimation:colorAnim forKey:@"backgroundColor"];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _round2.centerX = self.centerX;
    _round2.centerY = self.centerY;
    
    _round1.centerX = _round2.centerX - 20;
    _round1.centerY = _round2.centerY - 20;
    
    _round3.centerX = _round2.centerX + 20;
    _round3.centerY = _round3.centerY;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [_round1.layer removeAllAnimations];
    [_round2.layer removeAllAnimations];
    [_round3.layer removeAllAnimations];
    [self removeFromSuperview];
}

+ (UIImageView *)GIF {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width / 2.0 - 105, Screen_Height / 2.0 - 75, 210, 150)];
    
    NSMutableArray *names = [NSMutableArray new];
    
    for (NSInteger i = 1; i <= 10; i++) {
        [names addObject: [NSString stringWithFormat:@"loading-%ld", (long)i]];
    }
//    NSArray *names = @[@"Image-1",
//    @"Image-2",
//    @"Image-3",
//    @"Image-4",
//    @"Image-5",
//    @"Image-6",
//    @"Image-7",
//    @"Image-8",
//    @"Image-9",
//    @"Image-10",
//    @"Image-11",
//    @"Image-12",
//    @"Image-13",
//    @"Image-14",
//    @"Image-15",
//    @"Image-16",];
    
    NSMutableArray *images = [NSMutableArray new];
    for (NSString *name in names) {
        [images addObject:[UIImage imageNamed:name]];
    }
    imageView.image = images[0];
    imageView.animationImages = images;
    imageView.animationDuration = 0.5;
    imageView.animationRepeatCount = 0;
    
    [imageView startAnimating];
    
    return imageView;
}

@end

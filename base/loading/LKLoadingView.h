//
//  SKLoadingView.h
//  kkiou
//
//  Created by mac book pro on 2019/4/10.
//  Copyright © 2019年 mac book pro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EndBlock)(void);

@interface LKLoadingView : UIView

+ (void)show;
+ (void)dismiss;
+ (void)showBlock;

+ (void)showCountDown:(NSInteger)time block:(BOOL)block endCallBack:(EndBlock)endBlock;

+ (void)showLoadingWith:(UIView *)view;
+ (void)dissLoadingWith:(UIView *)view;
@end

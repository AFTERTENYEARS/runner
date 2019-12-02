//
//  SKAlertView.h
//  kkiou
//
//  Created by mac book pro on 2018/4/10.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertActionCallback)(void);

@interface LKAlertView : UIView

@property (nonatomic, strong) UIView * _Nonnull alertWrapper;
@property (nonatomic, strong) UILabel * _Nonnull titlelabel;
@property (nonatomic, strong) UILabel * _Nonnull messageLabel;
@property (nonatomic, strong) UIView * _Nonnull horizontalLine;
@property (nonatomic, strong) UIView * _Nonnull verticalLine;

@property (nonatomic, strong) UIButton * _Nonnull leftButton;
@property (nonatomic, strong) UIButton * _Nonnull rightButton;

@property (nonatomic, copy) AlertActionCallback _Nonnull leftCallback;
@property (nonatomic, copy) AlertActionCallback _Nonnull rightCallback;

+ (void)alertTitle:(NSString * _Nonnull)title
          msg:(NSString *_Nonnull)msg
         l:(NSString * _Nonnull)left
 lcb:(AlertActionCallback _Nonnull)leftCallback
        r:(NSString * _Nonnull)right
               rcb:(AlertActionCallback _Nonnull)rightCallback;

- (void)putUpWithTitle:(NSString * _Nonnull)title message:(NSString * _Nonnull)message leftButton:(NSString * _Nonnull)leftButton leftCallback:(AlertActionCallback _Nonnull)leftCallback rightButton:(NSString * _Nonnull)rightButton rightCallback:(AlertActionCallback _Nonnull)rightCallback;

@end

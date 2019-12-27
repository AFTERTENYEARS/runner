//
//  Func.h
//  runner
//
//  Created by runner on 2019/9/6.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <Foundation/Foundation.h>


#define String_By_TimeStamp(timeStamp) [Func string_by_timestamp:timeStamp]

NS_ASSUME_NONNULL_BEGIN
typedef void(^PwdCallback)(NSString *pwd);

@interface Func : NSObject

+ (NSString *)string_by_timestamp:(double)timestamp;

+ (UIViewController * _Nullable)currentVC;

+ (void)toast:(NSString *_Nullable)msg;

+ (LKNav *)navByTitle:(NSString *)title;

+ (LKNav *)redNavByTitle:(NSString *)title;

+ (UIView *)maskView;

+ (UIView *)topTriangleViewWithPoint:(CGPoint)point width:(CGFloat)width text:text;

+ (UIView *)topMarkViewWithPoint:(CGPoint)point text:(NSString *)text;

+ (void)passwordPresentTexts:(NSArray *)texts Callback:(PwdCallback)callback;

+ (void)sdUrlImage:(UIImageView *)imageView url: (NSString *)url;

+ (NSString *)fullurl: (NSString *)url;

+ (void)switchToLoginPage;

+ (void)switchTarbarPage;

+ (BOOL)needWelcomePage;

+ (NSString *)inviteUrl;

+ (NSString *)secureName:(NSString *)name;

+ (NSString *)secureMobile:(NSString *)mobile;

+ (NSString *)bankTail:(NSString *)bankcard;

+ (BOOL)realName;

+ (void)switchToAuthPage;

+ (BOOL)withdrawpwd;

+ (void)switchToSetWithdrawPwd;

+ (NSString *)MD5:(NSString *)string;

+ (void)removeLastVC:(UINavigationController *)navigationController;

+ (BOOL)pwdLimit:(NSString *)pwd;

+ (BOOL)regex:(NSString *)string set:(NSString *)charSet;


@end

NS_ASSUME_NONNULL_END

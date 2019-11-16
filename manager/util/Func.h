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

+ (UIView *)maskView;

+ (UIView *)topTriangleViewWithPoint:(CGPoint)point width:(CGFloat)width text:text;

+ (UIView *)topMarkViewWithPoint:(CGPoint)point text:(NSString *)text;

+ (void)passwordPresentCallback:(PwdCallback)callback;

@end

NS_ASSUME_NONNULL_END

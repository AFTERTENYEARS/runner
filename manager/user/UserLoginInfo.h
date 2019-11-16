//
//  UserLoginInfo.h
//  runner
//
//  Created by runner on 2019/9/12.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

@protocol UserInfoUpdate <NSObject>

- (void)userInfoUpdate;

@end

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserLoginInfo : NSObject

@property (nonatomic, strong) NSMutableArray<id<UserInfoUpdate>> *delegates;

+ (void)saveToken:(NSString *)token;

+ (NSString *)token;

+ (void)loadUserInfo;

+ (BOOL)login;

+ (void)saveUserInfo:(NSDictionary *)userInfo;

+ (NSDictionary *)userInfo;

+ (void)addDelegate:(id<UserInfoUpdate>)delegate;

+ (void)removeDelegate:(id<UserInfoUpdate>)delegate;


@end

NS_ASSUME_NONNULL_END

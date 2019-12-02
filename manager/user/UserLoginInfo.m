//
//  UserLoginInfo.m
//  runner
//
//  Created by runner on 2019/9/12.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "UserLoginInfo.h"

NSMutableArray<id<UserInfoUpdate>> *delegates;

#define USER_TOKEN @"userToken"
#define USER_INFO @"userInfo"

@implementation UserLoginInfo

+ (instancetype)manager {
    static UserLoginInfo *manager;
    if (!manager) {
        manager = [[[self class] alloc] init];
        manager.delegates = [NSMutableArray<id<UserInfoUpdate>> new];
    }
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)saveToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:USER_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)token {
    return String_By_Obj([NSUserDefaults standardUserDefaults], USER_TOKEN);
}

+ (void)loadUserInfo {
    if ([UserLoginInfo login]) {
        LKDLog(@"token: %@" , [UserLoginInfo token]);
    }
    if ([UserLoginInfo login]) {
        [UserLoginInfo saveUserInfo:[UserLoginInfo userInfo]];
    }
    [NetWork request:post url:@"vba-api/retail/member/getInfo" parameters:nil progress:nil loading:none netCallBack:^(NetValue * _Nonnull netValue) {
        LKDLog(@"%@", netValue.toJSON);
        if (netValue.success) {
            [UserLoginInfo saveUserInfo:Value_By_Obj(netValue.body, USER_INFO)];
        }
    }];
}

+ (BOOL)login {
    NSString *token = String_By_Obj([NSUserDefaults standardUserDefaults], USER_TOKEN);
    return token.length > 0 ? YES : NO;
}

+ (void)saveUserInfo:(NSDictionary *)userInfo {
    [[NSUserDefaults standardUserDefaults] setObject:Json_By_Dic(userInfo) forKey:USER_INFO];
    [[NSUserDefaults standardUserDefaults] synchronize];
    for (id<UserInfoUpdate> delegate in [UserLoginInfo manager].delegates) {
        [delegate userInfoUpdate];
    }
}

+ (NSDictionary *)userInfo {
    return Value_By_Obj([NSUserDefaults standardUserDefaults], USER_INFO) ? Dic_By_Json(Value_By_Obj([NSUserDefaults standardUserDefaults], USER_INFO)) : @{};
}

+ (BOOL)real {
    BOOL authenticationStatus = Int_By_Obj([UserLoginInfo userInfo], @"authenticationStatus") == 4 ? YES : NO;
    return authenticationStatus;
}

+ (void)addDelegate:(id<UserInfoUpdate>)delegate {
    [[UserLoginInfo manager].delegates addObject:delegate];
}

+ (void)removeDelegate:(id<UserInfoUpdate>)delegate {
    [[UserLoginInfo manager].delegates removeObject:delegate];
}

@end

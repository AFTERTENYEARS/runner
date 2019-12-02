//
//  NetWork.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "NetWork.h"
#import "NetAPI.h"
#import <AFNetworking/AFNetworking.h>
#import "LKLoadingView.h"

@implementation NetWork

+ (void)request:(NetWorkType)type url:(NSString *)url parameters:(id _Nullable)parameters progress:(DownloadProgress  _Nullable)progress loading:(Loading)loading netCallBack: (NetCallBack)netCallBack {
    
    [LKLoadingView dismiss];
    
    if (loading == defaul) {
        [LKLoadingView show];
    }
    if (loading == block) {
        [LKLoadingView showBlock];
    }
    if (loading == none) {
        
    }
    
    if (type == get) {
        [[self RequestManager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handSuccesss:task responseObject:responseObject url:url parameters:parameters netCallBack:netCallBack];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handFailure:task error:error url:url parameters:parameters netCallBack:netCallBack];
        }];
    }
    if (type == post) {
        [[self RequestManager] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //LKDLog(@"%@", responseObject);
            [self handSuccesss:task responseObject:responseObject url:url parameters:parameters netCallBack:netCallBack];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //LKDLog(@"%@", error);
            [self handFailure:task error:error url:url parameters:parameters netCallBack:netCallBack];
        }];
    }
    if (type == put) {
        [[self RequestManager] PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handSuccesss:task responseObject:responseObject url:url parameters:parameters netCallBack:netCallBack];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handFailure:task error:error url:url parameters:parameters netCallBack:netCallBack];
        }];
    }
    if (type == delet) {
        [[self RequestManager] DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handSuccesss:task responseObject:responseObject url:url parameters:parameters netCallBack:netCallBack];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handFailure:task error:error url:url parameters:parameters netCallBack:netCallBack];
        }];
    }
}

+ (void)handSuccesss: (NSURLSessionDataTask * _Nonnull)task responseObject: (id  _Nullable)responseObject url: (NSString *)url parameters: (NSDictionary *)parameters netCallBack: (NetCallBack)netCallBack{
    [LKLoadingView dismiss];
    
    NSURLResponse *response = [task response];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    LKDLog(@"%@", [httpResponse allHeaderFields]);
    NSInteger statusCode = [httpResponse statusCode];
    NetValue *netValue = [[NetValue alloc] init];
    netValue.url = url;
    netValue.parameters = parameters;
    netValue.statusCode = statusCode;
    netValue.code = Int_By_Obj(responseObject, @"code");
    netValue.success = netValue.code == 0 ? YES : NO;
    netValue.body = responseObject;
    if (netValue.code == -1) {
        //这里要跳转登录页面
        netValue.msg = @"登录信息已过期，请重新登录...";
        [Func switchToLoginPage];
    } else {
        netValue.msg = String_By_Obj(responseObject, @"msg");// netValue.code == 0 ? String_By_Obj(responseObject, @"msg") : @"";
    }
    
    if (netCallBack) {
        netCallBack(netValue);
    }
}

+ (void)handFailure: (NSURLSessionDataTask * _Nullable)task error: (NSError * _Nonnull)error  url: (NSString *)url parameters: (NSDictionary *)parameters netCallBack: (NetCallBack)netCallBack{
    [LKLoadingView dismiss];
    
    NSURLResponse *response = [task response];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    LKDLog(@"%@", [httpResponse allHeaderFields]);
    
    NSInteger statusCode = [httpResponse statusCode];
    NSString* jsonStr = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *errorMessage = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:0];
    
    NetValue *netValue = [[NetValue alloc] init];
    netValue.url = url;
    netValue.parameters = parameters;
    netValue.statusCode = statusCode;
    netValue.code = -10;
    netValue.success = NO;
    netValue.body = @{@"code": @-10, @"msg": @"http error"};
    if (error.code == -1011) {
        netValue.msg = @"请求url无效...";
    } else if (error.code == -1001) {
        netValue.msg = @"连接超时...";
    }   else if (error.code == -1004) {
        netValue.msg = @"服务器无响应...";
    } else {
        netValue.msg = String_By_Obj(errorMessage, @"error");
    }
    
    if (netCallBack) {
        netCallBack(netValue);
    }
}

+ (AFHTTPSessionManager * _Nonnull)RequestManager {
    AFHTTPSessionManager *manager;
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if ([UserLoginInfo login]) {
        [manager.requestSerializer setValue:[UserLoginInfo token] forHTTPHeaderField:@"RetailToken"];
    }
    
    return manager;
}


/*
 + (AFHTTPSessionManager * _Nonnull)RequestManager {
 AFHTTPSessionManager *manager;
 
 //    if (manager) {
 //        return manager;
 //    }
 manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
 manager.responseSerializer = [AFJSONResponseSerializer serializer];
 manager.requestSerializer = [AFJSONRequestSerializer serializer];
 manager.requestSerializer.timeoutInterval = 15.0f;
 [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
 
 //[manager.requestSerializer setValue:@"http://application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
 //[manager.requestSerializer setValue:@"IOS" forHTTPHeaderField:@"x-user-client"];
 //UserLoginInfo *userLoginInfo = [UserLoginInfo userLoginInfo];
 
 if ([UserLoginInfo login]) {
 //        NSString *bearerToken = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"Bearer %@", [UserLoginInfo token]]];
 //        [manager.requestSerializer setValue:bearerToken forHTTPHeaderField:@"Authorization"];
 //        NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
 //        [cookieProperties setObject:@"token" forKey:NSHTTPCookieName];
 //        [cookieProperties setObject:bearerToken forKey:NSHTTPCookieValue];
 //        [cookieProperties setObject:BASE_URL forKey:NSHTTPCookieDomain];
 //        [cookieProperties setObject:BASE_URL forKey:NSHTTPCookieOriginURL];
 //        [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
 //        [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
 //        [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:2629743] forKey:NSHTTPCookieExpires];
 //
 //        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
 //        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
 
 [manager.requestSerializer setValue:[UserLoginInfo token] forHTTPHeaderField:@"RetailToken"];
 //        NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
 //        [cookieProperties setObject:@"token" forKey:NSHTTPCookieName];
 //        [cookieProperties setObject:[UserLoginInfo token] forKey:NSHTTPCookieValue];
 //        [cookieProperties setObject:BASE_URL forKey:NSHTTPCookieDomain];
 //        [cookieProperties setObject:BASE_URL forKey:NSHTTPCookieOriginURL];
 //        [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
 //        [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
 //        [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:2629743] forKey:NSHTTPCookieExpires];
 //
 //        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
 //        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
 }
 
 return manager;
 }
 */

@end

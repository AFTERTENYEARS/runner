//
//  AppDelegate.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "AppDelegate.h"
#import "AppInitUtils.h"
#import "TabbarPage.h"
#import "ViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import <WXApi.h>

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
     
    UINavigationController *tabbarPage = [[UINavigationController alloc] initWithRootViewController:[[TabbarPage alloc] init]];
    //UINavigationController *loginPage = [[UINavigationController alloc] initWithRootViewController:[[FLoginPage alloc] init]];
    
    //self.window.rootViewController = [UserLoginInfo login] ? tabbarPage : loginPage;
    self.window.rootViewController = tabbarPage;
    
    //    UINavigationController *vcPage = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    //    self.window.rootViewController = vcPage;
    
    [AppInitUtils AppInit];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}

//支付宝
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    LKDLog(@"%@", url.host);
    //微信支付回调
    if ([url.host isEqualToString:@"pay"]) {
        [WXApi handleOpenURL:url delegate:self];
    }
    //支付宝支付回调
    if ([url.host isEqualToString:@"safepay"]) {
        [self alipayCallback:url];
    }
    return YES;
}

//支付宝支付回调
- (void)alipayCallback: (NSURL *)url {
    /*
     9000    订单支付成功
     4000    订单支付失败
     8000    正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
     5000    重复请求
     6001    用户中途取消
     6002    网络连接出错
     6004    支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
     其它    其它支付错误
     */
    //跳转支付宝钱包进行支付，处理支付结果
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        NSLog(@"result = %@",resultDic);
        NSString *resultStatus = String_By_Obj(resultDic, @"resultStatus");
        if ([resultStatus isEqualToString:@"9000"]) {
            //订单支付成功
            //[Func toast: @"支付成功"];
        } else {
            //支付失败
            //[Func toast: @"支付未成功"];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AlipayCallback" object:@{@"status": @(1)} userInfo:nil];
    }];
    
}

//微信支付回调
- (void)onReq:(BaseReq *)req{
    
}

- (void)onResp:(BaseResp *)resp{
    //判断是否是微信支付回调 (注意是PayResp 而不是PayReq)
    if ([resp isKindOfClass:[PayResp class]]) {
        NSString * wxPayResult;
        //支付返回的结果, 实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case WXSuccess:
                wxPayResult = @"success";
                break;
            case WXErrCodeUserCancel:
                wxPayResult = @"cancel";
                break;
            default:
                wxPayResult = @"faile";
                break;
        }
        //发出通知 从微信回调回来之后,发一个通知,让请求支付的页面接收消息,并且展示出来,或者进行一些自定义的展示或者跳转
        [[NSNotificationCenter defaultCenter] postNotificationName:@"WXpayCallback" object:@{@"status": @(1)} userInfo:nil];
    }
}




@end

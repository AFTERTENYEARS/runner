//
//  AppDelegate.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "AppDelegate.h"
#import "AppInitUtils.h"
#import <AudioToolbox/AudioToolbox.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //初始化
    [AppInitUtils AppInit:launchOptions window:self.window];
    //启动页停留
    //[NSThread sleepForTimeInterval:0.1];
    [self.window makeKeyAndVisible];
    
    //用户点击消息打开app（如果用户不是点击消息打开则pushNotificationKey为nil）
    NSDictionary *pushNotificationKey = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (Is_Null(pushNotificationKey)) {
        //正常打开app
    } else {
        //点击消息打开app
        [self pushNotificationKey:pushNotificationKey];
    }
    
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

//其他应用回调
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    //LKDLog(@"%@", url.host);
    //微信支付回调
//    if ([url.host isEqualToString:@"pay"]) {
//        [WXApi handleOpenURL:url delegate:self];
//    }
//    //支付宝支付回调
//    if ([url.host isEqualToString:@"safepay"]) {
//        [self alipayCallback:url];
//    }
    return YES;
}

//MARK: ！！！ 支付宝回调
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
//    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//        //NSLog(@"result = %@",resultDic);
//        NSString *resultStatus = String_By_Obj(resultDic, @"resultStatus");
//        if ([resultStatus isEqualToString:@"9000"]) {
//            //订单支付成功
//            //[Func toast: @"支付成功"];
//        } else {
//            //支付失败
//            //[Func toast: @"支付未成功"];
//        }
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"AlipayCallback" object:@{@"status": @(1)} userInfo:nil];
//    }];
    
}



//MARK: ！！！ 阿里云推送
//苹果推送注册成功回调，将苹果返回的deviceToken上传到CloudPush服务器
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}
//苹果推送注册失败回调
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //NSLog(@"didFailToRegisterForRemoteNotificationsWithError %@", error);
}

//注册推送消息到来监听
- (void)registerMessageReceive {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onMessageReceived:)
                                                 name:@"CCPDidReceiveMessageNotification"
                                               object:nil];
}
//处理到来推送消息
- (void)onMessageReceived:(NSNotification *)notification {
//    CCPSysMessage *message = [notification object];
//    NSString *title = [[NSString alloc] initWithData:message.title encoding:NSUTF8StringEncoding];
//    NSString *body = [[NSString alloc] initWithData:message.body encoding:NSUTF8StringEncoding];
//    NSLog(@"Receive message title: %@, content: %@.", title, body);
}
//App处于启动状态时，通知打开回调
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo {
    //前台收到消息震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    //前台收到消息音效
    //AudioServicesPlaySystemSound(1007);
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_ReceiveMsg object:nil];
    
    //NSLog(@"Receive one notification.");
    // 取得APNS通知内容
    NSDictionary *aps = [userInfo valueForKey:@"aps"];
    // 内容
    NSString *content = [aps valueForKey:@"alert"];
    // badge数量
    NSInteger badge = [[aps valueForKey:@"badge"] integerValue];
    // 播放声音
    NSString *sound = [aps valueForKey:@"sound"];
    // 取得Extras字段内容
    NSString *Extras = [userInfo valueForKey:@"Extras"]; //服务端中Extras字段，key是自己定义的
    //NSLog(@"%@", Json_By_Dic(userInfo));
    NSLog(@"content = [%@], badge = [%ld], sound = [%@], Extras = [%@]", content, (long)badge, sound, Extras);
    // iOS badge 清0
    application.applicationIconBadgeNumber = 0;
    // 通知打开回执上报
    // [CloudPushSDK handleReceiveRemoteNotification:userInfo];(Deprecated from v1.8.1)
    //[CloudPushSDK sendNotificationAck:userInfo];
    
    //LKDLog(@"%@", Json_By_Dic(userInfo));
    /*
     userInfo结构
     {
        "aps" : {
          "alert" : {
            "title" : "ttt",
            "body" : "ccc"
          },
          "sound" : "default"
        },
       "m" : "500057&&ALIYUN_28189588_500057&&ALIYUN_c06dd8da4d0244429d262372fd0a75a5&&00&&@apns",
       "i" : 128014752,
       "key1" : "value1",
       "key2" : "value2"
     }
     */
    
    //[Func toast:Json_By_Dic(userInfo)];
}

//处理通过点击消息打开app动作动作
- (void)pushNotificationKey: (NSDictionary *)pushNotificationKey {
    /*
     pushNotificationKey结构
     {
        "aps" : {
            "alert" : {
                "title" : "标题",
                "body" : "内容"
            }
            "sound" : "default"
        },
        "i" : 128012192,
        "m" : "500047&& ALIYUN281895885000478&ALYUNCO6dd8da4d0244429d262372fd0a75a5&800&&@apns",
        "自定义key1" : "自定义value1",
        "自定义key2" : "自定义value2"
     }
    */
    
    //[Func toast:Json_By_Dic(pushNotificationKey)];
}




@end

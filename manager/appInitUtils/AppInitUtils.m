//
//  AppInitUtils.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#define WX_APPID @"wx26950a96938f411a"
#define UNIVERSAL_LINK @"https://www.klz888.com/universallinks/"
#define ALIYUNPUSH_APP_KEY @"28189588"
#define ALIYUNPUSH_APP_SECRET @"c7b05a0d2ab7c3bc834002b57ae36680"

#import "AppInitUtils.h"

#import "VersionUpdate.h"
#import "WelcomePage.h"
#import "TabbarPage.h"


@implementation AppInitUtils

+ (void)AppInit: (NSDictionary *)launchOptions window: (UIWindow *)window {
    //初始化智能键盘
    [self initIQKeyboardManager];
    //初始化默认主页面
    [self initPageDefault:window];
    //初始化微信SDK
    [self initWX];
    //初始化阿里云推送
    [self initCloudPush: launchOptions];
    //是否需要版本更新
    ///[VersionUpdate versionUpdate];
    //刷新个人信息
    if ([UserLoginInfo login]) {
        [UserLoginInfo loadUserInfo];
    }
}

+ (void)initPageDefault: (UIWindow *)window {
    UINavigationController *tabbarPage = [[UINavigationController alloc] initWithRootViewController:[[TabbarPage alloc] init]];
    //UINavigationController *loginPage = [[UINavigationController alloc] initWithRootViewController:[[FLoginPage alloc] init]];
    
//    //欢迎页
//    if ([Func needWelcomePage]) {
//        window.rootViewController = [[WelcomePage alloc] init];
//    } else {
//        window.rootViewController = [UserLoginInfo login] ? tabbarPage : loginPage;
//    }
    
    window.rootViewController = tabbarPage;
    
    //    window.rootViewController = tabbarPage;
    //    UINavigationController *vcPage = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    //    window.rootViewController = vcPage;
}

+ (void)initIQKeyboardManager {
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    //keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    keyboardManager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
    keyboardManager.toolbarDoneBarButtonItemText = @"完成"; //完成按钮
}

+ (void)initWX {
    //[WXApi registerApp:WX_APPID universalLink:UNIVERSAL_LINK];
}

+ (void)initCloudPush:(NSDictionary *)launchOptions {
    // SDK初始化
//    [CloudPushSDK asyncInit:ALIYUNPUSH_APP_KEY appSecret:ALIYUNPUSH_APP_SECRET callback:^(CloudPushCallbackResult *res) {
//        if (res.success) {
//            //NSLog(@"Push SDK init success, deviceId: %@.", [CloudPushSDK getDeviceId]);
//        } else {
//            //NSLog(@"Push SDK init failed, error: %@", res.error);
//        }
//    }];
//    
//    UIApplication *application = [UIApplication sharedApplication];
//    
//    [application registerUserNotificationSettings:
//     [UIUserNotificationSettings settingsForTypes:
//      (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
//                                       categories:nil]];
//    [application registerForRemoteNotifications];
//    //阿里云通知打开监听
//    [CloudPushSDK sendNotificationAck:launchOptions];
}



@end

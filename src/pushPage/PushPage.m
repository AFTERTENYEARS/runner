//
//  PushPage.m
//  runner
//
//  Created by runner on 2019/9/6.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "PushPage.h"
#import "LKCountDown.h"

@interface PushPage ()

@end

@implementation PushPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LKCountDown *cd = [[LKCountDown alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    [cd customTitle:@"获取" time:10 describe:@"后重新获取" again:@"重新获取" excuteFunc:^void{
        NSDictionary *params = @{@"mobile" : @"17666111185"};
        [NetWork request:post url:@"/vba-api/api/code" parameters:params progress:nil loading:block netCallBack:^(NetValue * _Nonnull netValue) {
            [cd countDown];
        }];
    }];
    
    [self.view addSubview:cd];
    
}

- (UIView *)return_nav_bar {
    LKNav *nav = [LKNav backStyleWithTitle:@"push"];
    nav.backgroundColor = [UIColor grayColor];
    return nav;
}

- (enum lk_status_bar_style)return_status_bar_style {
    return lk_status_black;
}

@end

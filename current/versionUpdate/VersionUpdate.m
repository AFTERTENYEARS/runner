//
//  VersionUpdate.m
//  runner
//
//  Created by runner on 2019/12/9.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "VersionUpdate.h"
#import "VersionUpdateView.h"

@implementation VersionUpdate

+ (void)versionUpdate {
    [NetWork request:post url:retail_config_version parameters:@{} progress:nil loading:none netCallBack:^(NetValue * _Nonnull netValue) {
        LKDLog(@"%@", netValue.toJSON);
        if (netValue.success) {
            NSDictionary *config = netValue.body;
            NSString *c_version = String_By_Obj(config, @"ios");
            NSString *iosExplain = String_By_Obj(config, @"iosExplain");
            [self versionUpdate:c_version iosExplain: iosExplain];
        }
    }];
    //[self versionUpdate:@"3.0" iosExplain: @"1.版本更新"];
}

+ (void)versionUpdate:(NSString *)c_version iosExplain:(NSString *)iosExplain {
    if ([c_version componentsSeparatedByString:@"."].count != 2) {
        return;
    }
    //当前版本
    NSString *localVersion = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    NSArray *c_v = [c_version componentsSeparatedByString:@"."];
    NSArray *l_v = [localVersion componentsSeparatedByString:@"."];
    
    BOOL need_update = NO;
    
    if ([c_v[0] integerValue] > [l_v[0] integerValue]) {
        need_update = YES;
    } else {
        if ([c_v[0] integerValue] == [l_v[0] integerValue] && [c_v[1] integerValue] > [l_v[1] integerValue]) {
            need_update = YES;
        }
    }
    
    if (!need_update) {
        return;
    }
        
    UIView *block = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    block.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    UIView *wrapper = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width * 0.15, Screen_Height * 0.2, Screen_Width * 0.7, Screen_Height * 0.6)];
    
    wrapper.hidden = YES;
    DELAY_EXECUTE(0.3, wrapper.hidden = NO);
    
    [block addSubview:wrapper];
    
    UIImageView *rocket = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, wrapper.width, 0.65 * wrapper.width)];
    rocket.contentMode = UIViewContentModeScaleAspectFill;
    rocket.image = [UIImage imageNamed:@"版本更新"];
    [wrapper addSubview:rocket];
    
    VersionUpdateView *view = View_By_Xib(@"VersionUpdateView");
    
    if (iosExplain.length > 0) {
        NSArray *contentList = [iosExplain componentsSeparatedByString:@"|"];
        NSMutableString *m_str = [NSMutableString new];
        for (NSString *s in contentList) {
            [m_str appendString:[NSString stringWithFormat:@"%@\n", s]];
        }
        view.content = m_str;
    } else {
        view.content = @"";
    }
    
    
    view.frame = CGRectMake(0, rocket.bottom-2, wrapper.width, view.height);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5.0f;
    [wrapper addSubview:view];
    
    CGFloat total_h = view.height + rocket.height;
    
    wrapper.frame = CGRectMake(wrapper.x, (Screen_Height - total_h) / 2.0, wrapper.width, total_h);
                      
    [[UIApplication sharedApplication].keyWindow addSubview:block];
      
    
    view.refuseButton.click = ^{
        [block removeFromSuperview];
    };
    
    view.updateNow.click = ^{
        [block removeFromSuperview];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.klz888.com/invitefriend/#/invitefriend/downloadAPP"]];
    };
    
}

@end

//
//  Page.h
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

enum lk_status_bar_style {
    lk_status_black,
    lk_status_white
};

NS_ASSUME_NONNULL_BEGIN

@interface Page : UIViewController

////nav
//@property (nonatomic, strong) UIView *nav_bar;

//获取nav_bar
- (UIView *)return_nav_bar;

//background_color(默认白色)
- (UIColor *)return_background_color;

//禁用返回手势(默认不禁用)
- (BOOL)return_back_from_gesture;

//status_bar_style(默认黑色)
- (enum lk_status_bar_style)return_status_bar_style;

@end

NS_ASSUME_NONNULL_END

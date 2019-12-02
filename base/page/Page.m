//
//  Page.m
//  runner
//
//  Created by runner on 2019/9/3.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "Page.h"

@interface Page ()

@property (nonatomic, strong) UIColor *background_color;

@property (nonatomic, assign) BOOL can_back_from_gesture;

@property (nonatomic, assign) enum lk_status_bar_style status_bar_style;

@end

@implementation Page

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    // 是否禁用返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = self.can_back_from_gesture ? YES : NO;
    }
    
    //状态栏颜色
    self.navigationController.navigationBar.barStyle = self.status_bar_style == lk_status_black ? UIBarStyleDefault : UIBarStyleBlack;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
    // 开启返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.nav_bar) {
        [self.view addSubview:self.nav_bar];
    }
    self.view.backgroundColor = self.background_color;
}

//获取nav_bar
- (UIView *)nav_bar {
    return self.return_nav_bar;
}

- (UIView *)return_nav_bar {
    return [UIView new];
}

//background_color
- (UIColor *)background_color {
    return self.return_background_color;
}

- (UIColor *)return_background_color {
    return COLOR(@"FAFAFA");
}

//获取can_back_from_gesture
- (BOOL)can_back_from_gesture {
    return self.return_back_from_gesture;
}

- (BOOL)return_back_from_gesture {
    return YES;
}

//status_bar_style
- (enum lk_status_bar_style)status_bar_style {
    return self.return_status_bar_style;
}

- (enum lk_status_bar_style)return_status_bar_style {
    return lk_status_black;
}

//- (void)dealloc {
//    //[LKLoadingView dismiss];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

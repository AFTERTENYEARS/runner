//
//  UIViewController+POP.m
//  runner
//
//  Created by runner on 2019/11/30.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "UIViewController+POP.h"
#import <AFNetworking.h>

//#import <AppKit/AppKit.h>


@implementation UINavigationController (POP)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
    //取消loading
    [LKLoadingView dismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0/*延迟执行时间*/ * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NetWork cancel];
    });
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    
    return NO;
}


@end

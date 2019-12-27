//
//  UIViewController+POP.h
//  runner
//
//  Created by runner on 2019/11/30.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>


@protocol ViewNavPopProtocol <NSObject>

@optional

// Override this method in UIViewController derived class to handle 'Back' button click

-(BOOL)navigationShouldPopOnBackButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (POP) <ViewNavPopProtocol>

@end

NS_ASSUME_NONNULL_END

//
//  LKStepPage.h
//  runner
//
//  Created by runner on 2019/11/15.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LKStepPage : UIViewController

- (void)customTitle:(NSString *)title subTitles:(NSArray<NSString *> *)subTitles Pages:(NSArray<UIViewController*> *)pages;

@end

NS_ASSUME_NONNULL_END

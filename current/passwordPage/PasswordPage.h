//
//  PasswordPage.h
//  runner
//
//  Created by runner on 2019/11/14.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PwdCallback)(NSString *pwd);

@interface PasswordPage : UIView

@property (nonatomic, copy) PwdCallback pwdCallBack;
@property (nonatomic, strong) NSArray<NSString *> *texts;
@end

NS_ASSUME_NONNULL_END

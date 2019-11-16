//
//  PwdView.h
//  runner
//
//  Created by runner on 2019/11/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PwdCallback)(NSString *pwd);

@interface PwdView : UIView

@property (nonatomic, copy) PwdCallback pwdCallBack;

- (instancetype)initWithLength: (NSInteger)length pwdCallback: (PwdCallback)pwdCallback;

@end

NS_ASSUME_NONNULL_END

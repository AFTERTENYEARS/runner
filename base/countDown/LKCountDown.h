//
//  LKCountDown.h
//  runner
//
//  Created by runner on 2019/9/10.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ExcuteFunc)(void);

NS_ASSUME_NONNULL_BEGIN

@interface LKCountDown : LKButton

- (instancetype)initWithFrame:(CGRect)frame;
- (void)customTitle:(NSString *)title time:(NSInteger)time describe:(NSString *)describe again:(NSString *)again excuteFunc:(ExcuteFunc)excuteFunc;
- (void)countDown;


@end

NS_ASSUME_NONNULL_END

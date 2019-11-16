//
//  LKItemSelect.h
//  kkiou
//
//  Created by kkiou on 2019/1/12.
//  Copyright © 2019 mac book pro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickItemCallback)(NSString *item, NSInteger index);

@interface LKItemSelect : UIView

+ (void)showWithDataArray:(NSArray *)dataArray clickItemCallback:(ClickItemCallback)clickItemCallback;

@end

NS_ASSUME_NONNULL_END

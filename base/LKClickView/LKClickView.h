//
//  LKClickView.h
//  runner
//
//  Created by runner on 2019/10/22.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickCallBack)(void);

@interface LKClickView : UIView

@property (nonatomic, assign) BOOL isClicked;

@property (nonatomic, copy) ClickCallBack clickCallBack;

@end

NS_ASSUME_NONNULL_END

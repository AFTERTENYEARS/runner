//
//  BottomView.h
//  runner
//
//  Created by runner on 2019/10/23.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeepLKButton.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickFunc)(void);

@interface BottomView : UIView

@property (nonatomic, strong) NSString *buttonTitle;

@property (nonatomic, copy) ClickFunc clickFunc;

@property (weak, nonatomic) IBOutlet DeepLKButton *controlButton;

@end

NS_ASSUME_NONNULL_END

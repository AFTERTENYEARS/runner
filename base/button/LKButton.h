//
//  LKButton.h
//  runner
//
//  Created by runner on 2019/9/11.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Click)(void);

@interface LKButton : UIButton

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highLightedColor;
@property (nonatomic, strong) UIColor *disabledColor;
@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleHilightedColor;

@property (nonatomic, copy) Click click;

- (void)customNormalColor:(UIColor *)normalColor highLightedColor:(UIColor *)highLightedColor disabledColor:(UIColor *)disabledColor titleNormalColor:(UIColor *)titleNormalColor titleHilightedColor:(UIColor *)titleHilightedColor;

@end

NS_ASSUME_NONNULL_END

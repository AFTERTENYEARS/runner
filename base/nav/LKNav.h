//
//  Nav.h
//  runner
//
//  Created by runner on 2019/9/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LKNav : UIView

//back_image
@property (nonatomic, strong) UIImageView *backImageView;

//back_item
@property (nonatomic, strong) UIButton *backItem;

//title
@property (nonatomic, strong) NSString *title;

//titleColor
@property (nonatomic, strong) UIColor *themeColor;

//fontSize
@property (nonatomic, assign) NSInteger fontSize;

//backImage
@property (nonatomic, strong) NSString *imageUrl;

//left_items
@property (nonatomic, strong) NSArray<UIButton *> *left_items;

//right_items
@property (nonatomic, strong) NSArray<UIButton *> *right_items;

- (instancetype)init;

+ (LKNav *)backStyleWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

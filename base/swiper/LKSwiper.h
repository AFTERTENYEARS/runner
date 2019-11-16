//
//  LKSwiper.h
//  runner
//
//  Created by runner on 2019/10/9.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickImageView)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface LKSwiper : UIView

@property (nonatomic, assign) NSInteger timeInterval;

@property (nonatomic, strong) NSArray *imageNameList;

@property (nonatomic, strong) NSArray *imageUrlList;

@property (nonatomic, copy) ClickImageView clickImage;

- (instancetype)init;

- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END

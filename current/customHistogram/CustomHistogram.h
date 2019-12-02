//
//  CustomHistogramHistogram.h
//  runner
//
//  Created by runner on 2019/11/18.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomHistogram : UIView

@property (nonatomic, strong) NSArray<NSString *> *items;
@property (nonatomic, strong) NSArray<NSNumber *> *values;
@property (nonatomic, strong) NSArray<NSString *> *marks;

@property (nonatomic, assign) NSInteger pages;
@property (nonatomic, assign) CGFloat columnWidth;
@property (nonatomic, assign) BOOL hideBottomLine;

- (void)drawChart;

@end

NS_ASSUME_NONNULL_END

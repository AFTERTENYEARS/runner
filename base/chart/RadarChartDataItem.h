//
//  RadarChartDataItem.h
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface RadarChartDataItem : NSObject

+ (instancetype)dataItemWithValue:(CGFloat)value description:(NSString *)description;

@property (nonatomic, assign) CGFloat value;

@property (nonatomic, strong) NSString *textDescription;

@end

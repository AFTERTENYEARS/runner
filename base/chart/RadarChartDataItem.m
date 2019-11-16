//
//  RadarChartDataItem.m
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import "RadarChartDataItem.h"

@implementation RadarChartDataItem

+ (instancetype)dataItemWithValue:(CGFloat)value description:(NSString *)description {
    
    RadarChartDataItem *item = [[RadarChartDataItem alloc] init];
    item.value = value;
    item.textDescription = description;
    return item;
}

- (void)setValue:(CGFloat)value {
    
    if (value < 0) {
        value = 0;
        NSLog(@"Value can not be negative");
    }
    _value = value;

}



@end

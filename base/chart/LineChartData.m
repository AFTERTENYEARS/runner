//
//  LineChartData.m
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import "LineChartData.h"

@implementation LineChartDataItem

+ (id)dataItemWithY:(CGFloat)Y X:(CGFloat)X {
    
    LineChartDataItem *item = [[LineChartDataItem alloc] init];
    item.y = Y;
    item.x = X;
    return item;
}

+ (id)dataItemWithY:(CGFloat)Y {
    
    return [self dataItemWithY:Y X:0];
}

@end

@implementation LineChartData

@end

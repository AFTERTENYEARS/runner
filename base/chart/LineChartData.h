//
//  LineChartData.h
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LineChartPointStyle) {
    
    LineChartPointStyleNone = 0,
    LineChartPointStyleCircle = 1, //圆形
    LineChartPointStyleSquare = 2, //方形
    LineChartPointStyleTriangle = 3, //三角形
};

@interface LineChartDataItem : NSObject

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat x;

+ (id)dataItemWithY:(CGFloat)Y X:(CGFloat)X;

+ (id)dataItemWithY:(CGFloat)Y;

@end

typedef LineChartDataItem * (^LineChartDataGetter)(NSInteger item);

@interface LineChartData : NSObject

@property (nonatomic, copy) LineChartDataGetter dataGetter;

/** 线颜色*/
@property (nonatomic, strong) UIColor *lineColor;
/** 线透明度*/
@property (nonatomic, assign) CGFloat lineAlpha;
/** 开始位置*/
@property (nonatomic, assign) NSInteger startIndex;
@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, assign) CGFloat lineWidth;

/** 点数值*/
@property (nonatomic, assign) BOOL showPointLabel;
/** 点数值颜色*/
@property (nonatomic, strong) UIColor *pointLabelColor;
/** 点数值字体大小*/
@property (nonatomic, strong) UIFont *pointLabelFont;
@property (nonatomic, strong) NSString *pointLabelFormat;

/** 虚线形态*/
@property (nonatomic, assign) BOOL showDash;
@property (nonatomic, strong) NSArray <NSNumber *> *lineDashPattern;

@property (nonatomic, assign) LineChartPointStyle lineChartPointStyle;
@property (nonatomic, assign) CGFloat inflexionPointWidth;
@property (nonatomic, strong) UIColor *inflexionPointFillColor;
@property (nonatomic, strong) UIColor *inflexionPointStrokeColor;

//渐变区域
/** 是否显示折线围成的渐变区域, 默认为0*/
@property (nonatomic, assign) BOOL showGradientArea;
/** 渐变开始的颜色 */
@property (nonatomic, strong) UIColor *startGradientColor;
/** 渐变结束的颜色 */
@property (nonatomic, strong) UIColor *endGradientColor;

@end

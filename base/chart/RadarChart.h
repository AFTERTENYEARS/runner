//
//  RadarChart.h
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadarChartDataItem;

typedef NS_ENUM(NSUInteger, RadarChartLabelStyle) {
    RadarChartLabelStyleCircle = 0, //圆环
    RadarChartLabelStyleHorizontal, //水平
    RadarChartLabelStyleHidden, //隐藏
};

@interface RadarChart : UIView

/**
 初始化图表

 @param frame frame
 @param items 模型数组
 @param unitValue 均分值
 @return 对象
 */
- (id)initWithFrame:(CGRect)frame items:(NSArray <RadarChartDataItem *> *)items valueDivider:(CGFloat)unitValue;

/** 绘制图表 */
- (void)strokeChart;

/**
 更新图表
 @param chartData 模型数组
 */
- (void)updateChartWithChartData:(NSArray <RadarChartDataItem *> *)chartData;

/** Array of `RadarChartDataItem` objects, one for each corner. */
@property (nonatomic, strong) NSArray <RadarChartDataItem *> *chartDataItems;
/** 展示的样式 */
@property (nonatomic, assign) RadarChartLabelStyle labelStyle;
/** The unit of this chart ,default is 1 */
@property (nonatomic, assign) CGFloat valueDivider;
/** The maximum for the range of values to display on the chart */
@property (nonatomic, assign) CGFloat maxValue;
/** Default is gray. */
@property (nonatomic, strong) UIColor *webColor;
/** Default is green , with an alpha of 0.7 */
@property (nonatomic, strong) UIColor *plotFillColor;
/** Default is green*/
@property (nonatomic, strong) UIColor *plotStrokeColor;
/** Default is black */
@property (nonatomic, strong) UIColor *fontColor;
/** Default is orange */
@property (nonatomic, strong) UIColor *graduationColor;
/** Default is 12 */
@property (nonatomic, assign) CGFloat titleFontSize;
/** Tap the label will display detail value ,default is YES. */
@property (nonatomic, assign) BOOL canLabelTouchable;
/** is show graduation on the chart ,default is NO. */
@property (nonatomic, assign) BOOL isShowGraduation;
/** is display animated, default is YES */
@property (nonatomic, assign) BOOL displayAnimated;
/** 是否是顺时针方向绘制，默认是YES*/
@property (nonatomic, assign) BOOL clockwise;

@end

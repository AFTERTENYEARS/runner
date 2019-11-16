//
//  CircleChart.h
//  ChartDemo
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 runner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICountingLabel.h"

@interface CircleChart : UIView
#pragma mark - 属性
/** 计数Label */
@property (strong, nonatomic) UICountingLabel *countingLabel;
/** 圆环颜色 */
@property (nonatomic) UIColor *strokeColor;
/** 开始渐变颜色 */
@property (nonatomic) UIColor *strokeColorGradientStart;
/** 圆环的阴影颜色，默认为nil */
@property (nonatomic) UIColor *shadowColor;
/** 最大的值 */
@property (nonatomic) NSNumber *total;
/** 当前的值 */
@property (nonatomic) NSNumber *current;
/** 线宽 */
@property (nonatomic) NSNumber *lineWidth;
/** 动画持续时长 */
@property (nonatomic) NSTimeInterval duration;
/** 是否显示文字 */
@property (nonatomic) BOOL displayCountingLabel;
/** 是否动画，默认yes */
@property (nonatomic) BOOL displayAnimated;

#pragma mark - 初始化方法
- (id)initWithFrame:(CGRect)frame
              total:(NSNumber *)total
            current:(NSNumber *)current
          clockwise:(BOOL)clockwise;

- (id)initWithFrame:(CGRect)frame
              total:(NSNumber *)total
            current:(NSNumber *)current
          clockwise:(BOOL)clockwise
             shadow:(BOOL)hasBackgroundShadow
        shadowColor:(UIColor *)backgroundShadowColor;

- (id)initWithFrame:(CGRect)frame
              total:(NSNumber *)total
            current:(NSNumber *)current
          clockwise:(BOOL)clockwise
             shadow:(BOOL)hasBackgroundShadow
        shadowColor:(UIColor *)backgroundShadowColor
displayCountingLabel:(BOOL)displayCountingLabel;

-  (id)initWithFrame:(CGRect)frame
               total:(NSNumber *)total
             current:(NSNumber *)current
           clockwise:(BOOL)clockwise
              shadow:(BOOL)hasBackgroundShadow
         shadowColor:(UIColor *)backgroundShadowColor
displayCountingLabel:(BOOL)displayCountingLabel
   overrideLineWidth:(NSNumber *)overrideLineWidth;

#pragma mark - 绘制或更新图表
- (void)strokeChart;
- (void)growChartByAmount:(NSNumber *)growAmount;
- (void)updateChartByCurrent:(NSNumber *)current;
- (void)updateChartByCurrent:(NSNumber *)current byTotal:(NSNumber *)total;
@end

//
//  HistogramChart.h
//  runner
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistogramChart : UIView


/** 坐标轴线宽，默认为1 */
@property (nonatomic, assign) CGFloat coordinateAxisLineWidth;
/** 坐标轴颜色，默认darkgray */
@property (nonatomic, strong) UIColor *coordinateAxisColor;
/** 距左边距，默认25 */
@property (nonatomic, assign) CGFloat chartMarginLeft;
/** 距右边距，默认25 */
@property (nonatomic, assign) CGFloat chartMarginRight;
/** 距上边距，默认0 */
@property (nonatomic, assign) CGFloat chartMarginTop;
/** 距下边距，默认25 */
@property (nonatomic, assign) CGFloat chartMarginBottom;
/** 坐标轴的高度 */
@property (nonatomic) CGFloat chartCavanHeight;
/** 坐标轴的宽度*/
@property (nonatomic) CGFloat chartCavanWidth;

/******************* xLabel属性 ***************************/
/** x轴标题*/
@property (nonatomic, strong) NSArray *xLabelTitles;
/** xlabel字体  默认10 */
@property (nonatomic, strong) UIFont *xLabelFont;
/** xlabel颜色 默认是graycolor */
@property (nonatomic, strong) UIColor *xLabelColor;

/******************* yLabel属性 ***************************/
/** y轴标题*/
@property (nonatomic, strong) NSArray *yLabelTitles;
/** ylabel字体 默认10 */
@property (nonatomic) UIFont *yLabelFont;
/** ylabel颜色 默认graycolor */
@property (nonatomic) UIColor *yLabelColor;
/** y轴label数据的格式，默认是 @"%1.f" */
@property (nonatomic, strong) NSString *yLabelFormat;


/******************* 数据属性 ***************************/
/** 表数据 */
@property (nonatomic, strong) NSArray<NSNumber *> *data;

/******************* point属性 ***************************/
/** ylabel字体 默认10 */
@property (nonatomic) UIFont *pointFont;
/** ylabel颜色 默认graycolor */
@property (nonatomic) UIColor *pointColor;

/******************* 柱属性 ***************************/
/** 柱状图alpha 默认0.7 */
@property (nonatomic, assign) CGFloat columnAlpha;

- (void)strokeChart;

@end

NS_ASSUME_NONNULL_END

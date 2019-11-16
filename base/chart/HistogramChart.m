//
//  HistogramChart.m
//  runner
//
//  Created by runner on 2019/10/11.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "HistogramChart.h"

@interface HistogramChart ()

@property (nonatomic, assign) CGFloat xStep;
@property (nonatomic, assign) CGFloat yStep;

@property (nonatomic, strong) NSArray<UILabel *> *pointLabelArray;
@property (nonatomic, strong) NSArray<CAShapeLayer *> *columnArray;

@end

@implementation HistogramChart

#pragma mark - 初始化
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self configDefaultValues];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self configDefaultValues];
    }
    return self;
}

- (void)configDefaultValues {
    self.backgroundColor = UIColor.whiteColor;
    
    self.xLabelTitles = [NSArray new];
    self.yLabelTitles = [NSArray new];
    
    _pointLabelArray = [NSArray new];
    _columnArray = [NSArray new];
    
    _coordinateAxisLineWidth = 1.0f;
    _coordinateAxisColor = UIColor.darkGrayColor;
    _chartMarginLeft = 25.0f;
    _chartMarginBottom = 25.0f;
    _chartMarginRight = 25.0f;
    _chartMarginTop = 0.0f;
    
    _xLabelColor = [UIColor grayColor];
    _xLabelFont = [UIFont systemFontOfSize:10];
    
    _yLabelFont = [UIFont systemFontOfSize:10];
    _yLabelColor = [UIColor grayColor];
    _yLabelFormat = @"%.0f";
    
    _pointFont = [UIFont systemFontOfSize:10];
    _pointColor = [UIColor blackColor];
    
    _columnAlpha = 0.7;
}

- (void)strokeChart {
    [self removeAll];
    
    [self calcuateChart];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self setXlabel];
    [self setYlabel];
    [self strokeColumn];
    [self strokePointValue];
}

- (void)removeAll {
    _columnArray = [NSArray new];
    _pointLabelArray = [NSArray new];
}

- (void)calcuateChart {
    _chartCavanWidth = self.frame.size.width - _chartMarginLeft - _chartMarginRight;
    _chartCavanHeight = self.frame.size.height - _chartMarginBottom - _chartMarginTop;
    
    _xStep = _chartCavanWidth / (_xLabelTitles.count);
    _yStep = _chartCavanHeight/(_yLabelTitles.count);
}

- (void)setXlabel {
    for (NSInteger i = 0; i < _xLabelTitles.count; i++) {
        CGRect labelFrame = CGRectMake(_chartMarginLeft + _xStep * i, _chartMarginTop + _chartCavanHeight, _xStep, _chartMarginBottom);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.text = _xLabelTitles[i];
        label.textColor = _xLabelColor;
        label.font = _xLabelFont;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

- (void)setYlabel {
    for (NSInteger i = 1; i < _yLabelTitles.count; i++) {
        CGRect labelFrame = CGRectMake(0, _chartMarginTop + _chartCavanHeight - _yStep * 0.5 - i * _yStep, _chartMarginLeft-4, _yStep);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.text = _yLabelTitles[i];
        label.textColor = _yLabelColor;
        label.font = _yLabelFont;
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
    }
}

- (void)strokeColumn {
    for (NSInteger i = 0; i < self.data.count; i++) {
        CGFloat width = 48;
        if (_xStep * 1 / 2 < width) {
            width = _xStep * 1 / 2;
        }
        NSNumber *num = _data[i];
        CGFloat height = (num.floatValue / 100.0) * (_chartCavanHeight / 6.0 * 5.0);
        CGFloat x = _chartMarginLeft + (_xStep - width) / 2.0 + _xStep * i;
        CGFloat y = _chartMarginTop + _chartCavanHeight - height;
        CGRect columnFrame = CGRectMake(x, y, width, height);
        
        UIView *column = [[UIView alloc] init];
        column.backgroundColor = COLOR_ALPHA(COLOR_RANDOM, _columnAlpha);
        
        column.frame = CGRectMake(x, _chartMarginTop + _chartCavanHeight, width, 0);
        [UIView animateWithDuration:1.0 animations:^{
            column.frame = columnFrame;
        }];
        [self addSubview:column];
    }
//    NSMutableArray *columnArray = [NSMutableArray new];
//    for (NSInteger i = 0; i < self.data.count; i++) {
//        CGFloat width = 48;
//        if (_xStep * 1 / 2 < width) {
//            width = _xStep * 1 / 2;
//        }
//        NSNumber *num = _data[i];
//        CGFloat height = (num.floatValue / 100.0) * (_chartCavanHeight / 6.0 * 5.0);
//        CGFloat x = _chartMarginLeft + (_xStep - width) / 2.0 + _xStep * i;
//        CGFloat y = _chartMarginTop + _chartCavanHeight - height;
//
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        path.lineWidth = 1;
//        path.lineCapStyle = kCGLineCapButt;
//
//        CGPoint point1 = CGPointMake(x, y);
//        CGPoint point2 = CGPointMake(x+width, y);
//        CGPoint point3 = CGPointMake(x, y+height);
//        CGPoint point4 = CGPointMake(x+width, y+height);
//
//        [path moveToPoint:point1];
//        [path addLineToPoint:point2];
//        [path addLineToPoint:point4];
//        [path addLineToPoint:point3];
//        [path addLineToPoint:point1];
//        [path closePath];
//
//        CAShapeLayer *layer = [CAShapeLayer layer];
//        layer.path = path.CGPath;
//
//        UIColor *layerColor = COLOR_RANDOM;
//        layer.strokeColor = layerColor.CGColor;
//        layer.fillColor = layerColor.CGColor;
//
//        [self.layer addSublayer:layer];
//        [columnArray addObject:layer];
//    }
//    _columnArray = [columnArray copy];
}

- (void)strokePointValue {
    NSMutableArray *labelArray = [NSMutableArray new];
    for (NSInteger i = 0; i < self.data.count; i++) {
        
        NSNumber *num = _data[i];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:_yLabelFormat, num.floatValue];
        label.font = _pointFont;
        label.textColor = _pointColor;
        label.textAlignment = NSTextAlignmentCenter;
        
        CGFloat width = 48;
        if (_xStep * 1 / 2 < width) {
            width = _xStep * 1 / 2;
        }
        
        CGFloat horHeight = (num.floatValue / 100.0) * (_chartCavanHeight / 6.0 * 5.0);
        
        CGFloat x = _chartMarginLeft + (_xStep - width) / 2.0 + _xStep * i;
        CGFloat y = _chartMarginTop + _chartCavanHeight - horHeight - 20;
        CGRect columnFrame = CGRectMake(x, y, width, 15);
        
        label.frame = CGRectMake(x, _chartMarginTop + _chartCavanHeight, width, 0);
        [UIView animateWithDuration:1.0 animations:^{
            label.frame = columnFrame;
        }];
        [self addSubview:label];
        
        [labelArray addObject:label];
    }
    _pointLabelArray = [labelArray copy];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat yAxisMax = _chartCavanHeight + _chartMarginTop;
    CGFloat xAxisMax = _chartCavanWidth + _chartMarginLeft;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, _coordinateAxisLineWidth);
    CGContextSetStrokeColorWithColor(ctx, _coordinateAxisColor.CGColor);
    
    //画x轴线
    CGContextMoveToPoint(ctx, _chartMarginLeft, yAxisMax);
    CGContextAddLineToPoint(ctx, xAxisMax, yAxisMax);
    
    //画x轴三角形上
    CGContextMoveToPoint(ctx, xAxisMax, yAxisMax);
    CGContextAddLineToPoint(ctx, xAxisMax-5, yAxisMax-3);
    //画x轴三角形下
    CGContextMoveToPoint(ctx, xAxisMax, yAxisMax);
    CGContextAddLineToPoint(ctx, xAxisMax-5, yAxisMax+3);
    
    //绘制x轴分割点
    CGFloat y = _chartCavanHeight + _chartMarginTop;
    for (NSInteger i = 0; i < _xLabelTitles.count; i++) {
        CGFloat x = _chartMarginLeft + _xStep / 2 + i * _xStep;
        CGContextMoveToPoint(ctx, x, y+3);
        CGContextAddLineToPoint(ctx, x, y);
    }
    
    //画y轴线
    CGContextMoveToPoint(ctx, _chartMarginLeft, _chartMarginTop);
    CGContextAddLineToPoint(ctx, _chartMarginLeft, yAxisMax);
    //画y轴三角形左
    CGContextMoveToPoint(ctx, _chartMarginLeft, _chartMarginTop);
    CGContextAddLineToPoint(ctx, _chartMarginLeft-3, _chartMarginTop+5);
    //画y轴三角形右
    CGContextMoveToPoint(ctx, _chartMarginLeft, _chartMarginTop);
    CGContextAddLineToPoint(ctx, _chartMarginLeft+3, _chartMarginTop+5);
    
    //绘制y轴分割点
    CGFloat x = _chartMarginLeft;
    for (NSInteger i = 0; i < _yLabelTitles.count; i++) {
        CGFloat y = _chartMarginTop + _chartCavanHeight - _yStep * i;
        CGContextMoveToPoint(ctx, x, y);
        CGContextAddLineToPoint(ctx, x+3, y);
    }
    
    CGContextStrokePath(ctx);
    
    //绘制虚线
    CGContextSetStrokeColorWithColor(ctx, UIColor.lightGrayColor.CGColor);
    
    CGFloat dash[] = {3,3};
    CGContextSetLineDash(ctx, 0.0, dash, 2);
    
    for (NSInteger i = 1; i < _yLabelTitles.count; i++) {
        CGContextMoveToPoint(ctx, _chartMarginLeft, _chartMarginTop + _chartCavanHeight - _yStep * i);
        CGContextAddLineToPoint(ctx, _chartMarginLeft + _chartCavanWidth, _chartMarginTop + _chartCavanHeight - _yStep * i);
        CGContextStrokePath(ctx);
    }
}

@end

//
//  ColumnView.m
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "ColumnView.h"

@interface ColumnView ()

@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIView *column;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *markView;
@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, assign) CGFloat full_height;

@end

@implementation ColumnView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.columnWidth = 8.0f;
        self.hideBottomLine = YES;
    }
    return self;
}

- (void)setColumnItem:(NSString *)columnItem {
    _columnItem = columnItem;
}

- (void)setColumnValue:(CGFloat)columnValue {
    _columnValue = columnValue;
}

- (void)setColumnText:(NSString *)columnText {
    _columnText = columnText;
}

- (void)setHideMark:(BOOL)hideMark {
    _hideMark = hideMark;
    _markView.hidden = hideMark;
    _lineView.hidden = hideMark;
}

- (void)drawChart {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //itemLabel
    _itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 26, self.width, 26)];
    _itemLabel.font = [UIFont systemFontOfSize:10];
    _itemLabel.textColor = COLOR(@"999999");
    _itemLabel.textAlignment = NSTextAlignmentCenter;
    _itemLabel.numberOfLines = 0;
    
    _itemLabel.text = self.columnItem;//@"一\n级";
    [self addSubview:_itemLabel];
    
    _full_height = self.height - 20 - 22 - 4 - 26;
    
    //column
    _column = [[UIView alloc] initWithFrame:CGRectMake(self.width / 2.0 - self.columnWidth / 2.0, 20 + 22 + _full_height, self.columnWidth, 0)];
    _column.backgroundColor = COLOR(@"D95E5A");
    [self addSubview:_column];
    
    CGRect thecolumnRect =  CGRectMake(self.width / 2.0 - self.columnWidth / 2.0, self.height - 26 - 4 - _columnValue * _full_height, self.columnWidth, _columnValue * _full_height);
        
    [UIView animateWithDuration:0.5 animations:^{
        self->_column.frame = thecolumnRect;
    }];
    
    
    //lineView
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(self.width / 2.0, 20 + 22 + _full_height, 0.5, 0)];
    _lineView.backgroundColor = F5C8C8;//COLOR(@"");
    [self addSubview:_lineView];
    
    CGRect thecLineRect =  CGRectMake(self.width / 2.0, self.height - 26 - 4 -_columnValue * _full_height - 22, 0.5, _columnValue * _full_height + 22);
    _lineView.frame = thecLineRect;
    
    
    //markView
    //label
    UILabel *mark_label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 60, 40)];
    mark_label.font = [UIFont systemFontOfSize:10];
    mark_label.textAlignment = NSTextAlignmentCenter;
    mark_label.textColor = E94F4F;
    mark_label.text = _columnText;
    [mark_label sizeToFit];
    
    CGFloat w = mark_label.width + 10;
    CGFloat h = mark_label.height + 10 + 4.5;
    CGFloat x = (self.width - w) / 2.0;
    CGFloat y = 0;
            
    //contentView
    _markView = [[UIView alloc] init];
    _markView.frame = CGRectMake(x, y, w, h);
    
    //点
    CGPoint p1 = CGPointMake(0, 0);
    CGPoint p2 = CGPointMake(0, h - 4.5);
    CGPoint p3 = CGPointMake(w / 2.0 - 4.5, h - 4.5);
    CGPoint p4 = CGPointMake(w / 2.0, h);
    CGPoint p5 = CGPointMake(w / 2.0 + 4.5, h - 4.5);
    CGPoint p6 = CGPointMake(w, h - 4.5);
    CGPoint p7 = CGPointMake(w, 0);
    
    //path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p5];
    [path addLineToPoint:p6];
    [path addLineToPoint:p7];
    [path addLineToPoint:p1];
    [path closePath];
    
    //layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 0.5f;
    layer.strokeColor = F5C8C8.CGColor;
    layer.fillColor = F9F1F1.CGColor;
    layer.path = path.CGPath;
    
    [_markView.layer addSublayer:layer];
    
    mark_label.frame = CGRectMake(0, 0, w, h - 4.5);
    [_markView addSubview:mark_label];
    
    [self addSubview:_markView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapColumn:)];
    [self addGestureRecognizer:tap];
    
    //markView
    CGRect markRect = CGRectMake(_markView.x, self.height - 26 - 4 - _columnValue * _full_height - 22 - 20, _markView.width, 20);
    _markView.frame = markRect;
    
    //bottomLineView
    
    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 26 - 4, self.width, 5)];
    UIView *h_line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _bottomLineView.width, 0.5)];
    h_line.backgroundColor = COLOR(@"999999");
    UIView *v_line = [[UIView alloc] initWithFrame:CGRectMake(self.width / 2.0, 0.5, 0.5, 4.5)];
    v_line.backgroundColor = COLOR(@"999999");
    [_bottomLineView addSubview:h_line];
    [_bottomLineView addSubview:v_line];
    
    [self addSubview:_bottomLineView];
    
    _markView.hidden = _hideMark;
    _lineView.hidden = _hideMark;
    _bottomLineView.hidden = _hideBottomLine;
}

- (void)TapColumn: (UITapGestureRecognizer *)tapGesure {
    if (self.tapColumn) {
        self.tapColumn();
    }
}

@end

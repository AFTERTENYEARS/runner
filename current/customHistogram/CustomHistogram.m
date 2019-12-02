//
//  CustomHistogramHistogram.m
//  runner
//
//  Created by runner on 2019/11/18.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "CustomHistogram.h"
#import "ColumnView.h"

@interface CustomHistogram ()

@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) NSArray<ColumnView *> *column_array;

@end

@implementation CustomHistogram

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _pages = 7;
        _columnWidth = 12.0f;
        _hideBottomLine = YES;
        
        _contentView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.bounces = NO;
        [self addSubview:_contentView];
    }
    return self;
}

- (void)drawChart {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    //柱
    NSArray<NSString *> *items = _items;
    NSArray<NSNumber *> *values = _values;
    NSArray<NSString *> *marks = _marks;
    
    CGFloat step_w = self.width / _pages;
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSInteger i = 0; i < items.count; i++) {
        
        ColumnView *columnView = [[ColumnView alloc] initWithFrame:CGRectMake(step_w * i, 0, step_w, self.contentView.height)];
        columnView.columnWidth = _columnWidth;
        columnView.columnItem = items[i];
        columnView.columnValue = [values[i] floatValue];
        columnView.columnText = marks[i];
        columnView.hideMark = i == 0 ? NO : YES;
        columnView.hideBottomLine = _hideBottomLine;
        columnView.tapColumn = ^{
            for (ColumnView *column in self.column_array) {
                if (columnView.columnValue > 0) {
                    column.hideMark = columnView == column ? NO : YES;
                }
            }
        };
        [columnView drawChart];
        [array addObject:columnView];
        [self.contentView addSubview:columnView];
        
    }
    
    self.column_array = array;
    
    self.contentView.contentSize = CGSizeMake(step_w * items.count, self.contentView.height);
}


@end

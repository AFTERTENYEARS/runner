//
//  ColumnView.h
//  runner
//
//  Created by runner on 2019/11/7.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TapColumn)(void);

@interface ColumnView : UIView

@property (nonatomic, strong) NSString *columnItem;
@property (nonatomic, assign) CGFloat columnValue;
@property (nonatomic, strong) NSString *columnText;

@property (nonatomic, assign) CGFloat columnWidth;

@property (nonatomic, assign) BOOL hideMark;
@property (nonatomic, assign) BOOL hideBottomLine;

@property (nonatomic, copy) TapColumn tapColumn;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)drawChart;

@end

NS_ASSUME_NONNULL_END

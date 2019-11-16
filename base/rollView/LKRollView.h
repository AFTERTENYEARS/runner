//
//  RollView.h
//  runner
//
//  Created by runner on 2017/6/8.
//  Copyright © 2017年 runner. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 设置代理 */
@protocol RollViewDelegate <NSObject>

- (void)didSelectRollViewPicWithIndexPath:(NSInteger)index;

- (void)singleRollToIndex:(NSInteger)index;
@end


@interface LKRollView : UIView

@property (nonatomic, assign) id<RollViewDelegate> delegate;

@property (nonatomic, assign) NSInteger index;

/**
 初始化
 
 @param frame 设置View大小
 @param distance 设置Scroll距离View两侧距离
 @param gap 设置Scroll内部 图片间距
 @return 初始化返回值
 */
- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap;

/** 滚动视图数据 */
- (void)rollWithImageName:(NSArray *)ImageNameArr;

- (void)rollSingelScrollWithImageUrl:(NSArray *)ImageUrlArr;

@end

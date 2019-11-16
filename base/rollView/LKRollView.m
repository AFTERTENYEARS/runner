//
//  RollView.m
//  runner
//
//  Created by runner on 2017/6/8.
//  Copyright © 2017年 runner. All rights reserved.


// 不循环的滚动弹窗

#import "LKRollView.h"
#import <SDWebImage.h>

@interface LKRollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *rollDataArr;   // 图片数据

@property (nonatomic, assign) float halfGap;   // 图片间距的一半

@end
@implementation LKRollView

- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.halfGap = gap / 2;
        
        /** 设置 UIScrollView */
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(distance, 0, self.frame.size.width - 2 * distance, self.frame.size.height)];
        [self addSubview:self.scrollView];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        
        self.scrollView.clipsToBounds = NO;
        
        /** 添加手势 */
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self.scrollView addGestureRecognizer:tap];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        /** 数据初始化 */
        self.rollDataArr = [NSArray array];
        
    }
    
    
    return self;
}

#pragma mark - 视图数据
- (void)rollWithImageName:(NSArray *)ImageNameArr{
    self.rollDataArr = ImageNameArr;
    
    for (int i = 0; i < self.rollDataArr.count; i++) {
        for (UIView *underView in self.scrollView.subviews) {
            
            if (underView.tag == 400 + i) {
                [underView removeFromSuperview];
            }
        }
        
        UIImageView *picImageView = [[UIImageView alloc] init];
        picImageView.contentMode = UIViewContentModeScaleAspectFit;
        picImageView.layer.masksToBounds = YES;
        picImageView.layer.cornerRadius = 4.0f;
        picImageView.userInteractionEnabled = YES;
        picImageView.tag = 400 + i ;
        
        /**  说明
         *   1. 设置完 ScrollView的width, 那么分页的宽也为 width.
         *   2. 图片宽为a 间距为 gap, 那么 图片应该在ScrollView上居中, 距离ScrollView左右间距为halfGap.
         *   与 ScrollView的width关系为 width = halfGap + a + halfGap.
         *   3. distance : Scroll距离 底层视图View两侧距离.
         *   假设 要露出上下页内容大小为 m ,   distance = m + halfGap
         *
         *  图片位置对应关系 :
         *  0 ->  2 * halfGap ;
         *  1 ->  3 * halfGap + a ;
         *  2 ->  5 * halfGap + 2 * a ;
         .
         .
         *  i   -> (2 * i +1) *  halfGap + 2 *(width - 2 * halfGap )
         */
        
        CGFloat picImageViewWidth = self.scrollView.frame.size.width - 2 * self.halfGap;
        CGFloat picImageViewHeight = picImageViewWidth / 3 * 4;
        CGFloat picImageViewX = (2 * i + 1) * self.halfGap + i * picImageViewWidth;
        CGFloat picImageViewY = (self.frame.size.height - picImageViewHeight) / 2;
        
        picImageView.frame = CGRectMake(picImageViewX, picImageViewY, picImageViewWidth, picImageViewHeight);
        
        //设置图片
        picImageView.image = [UIImage imageNamed:self.rollDataArr[i]];
        [self.scrollView addSubview:picImageView];
    }
    //设置轮播图当前的显示区域
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (self.rollDataArr.count), 0);
}

- (void)rollSingelScrollWithImageUrl:(NSArray *)ImageUrlArr{
    self.rollDataArr = ImageUrlArr;
    
    for (int i = 0; i < self.rollDataArr.count; i++) {
        for (UIView *underView in self.scrollView.subviews) {
            
            if (underView.tag == 400 + i) {
                [underView removeFromSuperview];
            }
        }
        
        UIImageView *picImageView = [[UIImageView alloc] init];
        picImageView.contentMode = UIViewContentModeScaleAspectFit;
        picImageView.layer.masksToBounds = YES;
        picImageView.layer.cornerRadius = 4.0f;
        picImageView.userInteractionEnabled = YES;
        picImageView.tag = 400 + i ;
        
        /**  说明
         *   1. 设置完 ScrollView的width, 那么分页的宽也为 width.
         *   2. 图片宽为a 间距为 gap, 那么 图片应该在ScrollView上居中, 距离ScrollView左右间距为halfGap.
         *   与 ScrollView的width关系为 width = halfGap + a + halfGap.
         *   3. distance : Scroll距离 底层视图View两侧距离.
         *   假设 要露出上下页内容大小为 m ,   distance = m + halfGap
         *
         *  图片位置对应关系 :
         *  0 ->  2 * halfGap ;
         *  1 ->  3 * halfGap + a ;
         *  2 ->  5 * halfGap + 2 * a ;
         .
         .
         *  i   -> (2 * i +1) *  halfGap + 2 *(width - 2 * halfGap )
         */
        
        CGFloat picImageViewWidth = self.scrollView.frame.size.width - 2 * self.halfGap;
        CGFloat picImageViewHeight = picImageViewWidth / 3 * 4;
        CGFloat picImageViewX = (2 * i + 1) * self.halfGap + i * picImageViewWidth;
        CGFloat picImageViewY = (self.frame.size.height - picImageViewHeight) / 2;
        
        picImageView.frame = CGRectMake(picImageViewX, picImageViewY, picImageViewWidth, picImageViewHeight);
        
        
        //设置图片
        [picImageView sd_setImageWithURL:[NSURL URLWithString:self.rollDataArr[i]] /*placeholderImage:[UIImage imageNamed:@""]*/];
        [self.scrollView addSubview:picImageView];
    }
    //设置轮播图当前的显示区域
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (self.rollDataArr.count), 0);
}

- (void)setIndex:(NSInteger)index{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * index, 0);
    _index = index;
    NSInteger curIndex = self.scrollView.contentOffset.x  / self.scrollView.frame.size.width;
    [_delegate singleRollToIndex:curIndex];
}

#pragma mark - UIScrollViewDelegate 方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger curIndex = (NSInteger)scrollView.contentOffset.x  / (NSInteger)self.scrollView.frame.size.width;
    [_delegate singleRollToIndex:curIndex];
}

#pragma mark - 轻拍手势的方法
-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    if ([self.rollDataArr isKindOfClass:[NSArray class]] && (self.rollDataArr.count > 0)) {
        
        [_delegate didSelectRollViewPicWithIndexPath:(self.scrollView.contentOffset.x / self.scrollView.frame.size.width)];
    }else{
        
        [_delegate didSelectRollViewPicWithIndexPath:-1];
    }
    
}

@end

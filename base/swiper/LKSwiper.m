//
//  LKSwiper.m
//  runner
//
//  Created by runner on 2019/10/9.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKSwiper.h"

@interface LKSwiper ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSArray *imageList;

@property (nonatomic, assign) NSInteger increment;

@property (nonatomic, assign) BOOL isUrl;

@end

@implementation LKSwiper

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.timeInterval = 5;
        self.isUrl = NO;
        //self.imageList = @[@"LoginPage-select", @"LoginPage-select", @"LoginPage-select", @"LoginPage-select"];
        [self configUI];
    }
    return self;
}

- (void)setTimeInterval:(NSInteger)timeInterval {
    _timeInterval = timeInterval;
    [self configUI];
}

- (void)setImageNameList:(NSArray *)imageNameList {
    _imageNameList = imageNameList;
    _imageList = imageNameList;
    _isUrl = NO;
    [self configUI];
}

- (void)setImageUrlList:(NSArray *)imageUrlList {
    _imageUrlList = imageUrlList;
    _imageList = imageUrlList;
    _isUrl = YES;
    [self configUI];
}

- (void)configUI {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.scrollView.contentSize = CGSizeMake(self.width * self.imageList.count, self.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    [self addSubview:self.scrollView];
    
    for (NSInteger i = 0; i < self.imageList.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.width * i, 0, self.scrollView.width, self.scrollView.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.backgroundColor = COLOR_RANDOM;
        if (_isUrl) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageList[i]]];
        } else {
            imageView.image = [UIImage imageNamed:self.imageList[i]];
        }
        
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
        [imageView addGestureRecognizer:tapGesture];
                
        [self.scrollView addSubview:imageView];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 30, self.width, 30)];
    self.pageControl.numberOfPages = self.imageList.count;
    self.pageControl.userInteractionEnabled = NO;
    [self addSubview:self.pageControl];
    
    self.increment = 1;
    [self pageUpStart];
}

- (void)tapImage:(UITapGestureRecognizer *)tapImage {
    if (self.clickImage) {
        self.clickImage(tapImage.view.tag);
    }
}

- (void)pageUpStart {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer timerWithTimeInterval:self.timeInterval target:self selector:@selector(pageUp) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)pageUp {
    NSInteger current = self.scrollView.contentOffset.x / self.scrollView.width;
    if (current == self.imageList.count - 1) {
        self.increment = -1;
    } else if (current == 0) {
        self.increment = 1;
    }
    NSInteger toIndex = current + self.increment;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.contentOffset = CGPointMake(self.width * toIndex, 0);
    } completion:^(BOOL finished) {
        self.pageControl.currentPage = toIndex;
    }];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = index;
    [self pageUpStart];
}






@end

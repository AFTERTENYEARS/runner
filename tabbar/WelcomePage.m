//
//  WelcomePage.m
//  runner
//
//  Created by runner on 2019/12/5.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "WelcomePage.h"

@interface WelcomePage ()<UIScrollViewDelegate>

@end

@implementation WelcomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = FAFAFA;
    [self customUI];
}

- (void)customUI {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(Screen_Width * 3.0, Screen_Height);
    scrollView.delegate = self;
    
    NSArray *imgs = @[@"welcome-1", @"welcome-2", @"welcome-3"];
    
    for (NSInteger i = 0; i < imgs.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_Width * i, 0, Screen_Width, Screen_Height)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:imgs[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:imageView];
        
        if (i == 2) {
            LightLKButton *button = [[LightLKButton alloc] initWithFrame:CGRectMake(Screen_Width / 2.0 - 50, Screen_Height - Control_Bar_Height - 68 - 34, 100, 34)];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5.0f;
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            button.click = ^{
                [Func switchToLoginPage];
            };
            [imageView addSubview:button];
        }
        
    }
    
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, Screen_Height - Control_Bar_Height - 28.0, Screen_Width, 20)];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = COLOR(@"333333");
    pageControl.pageIndicatorTintColor = E5E5E5;
    pageControl.userInteractionEnabled = NO;
    pageControl.tag = 1001;
    
    [self.view addSubview:pageControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UIPageControl *pageControl = [self.view viewWithTag:1001];
    pageControl.currentPage = index;
}

@end

//
//  LKStepPage.m
//  runner
//
//  Created by runner on 2019/11/15.
//  Copyright © 2019 com.runner.www. All rights reserved.
//

#import "LKStepPage.h"

@interface LKStepPage ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSString *navTitle;
@property (nonatomic, strong) NSArray<NSString *> *subTitles;
@property (nonatomic, strong) NSArray<UIViewController *> *pages;

@property (nonatomic, strong) UIView *nav;
@property (nonatomic, strong) UIScrollView *titleView;
@property (nonatomic, strong) UIView *markView;
@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) NSMutableArray *subTitleButtons;

@end

@implementation LKStepPage

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navTitle = [[NSString alloc] init];
        self.subTitles = [[NSArray alloc] init];
        self.pages = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)customTitle:(NSString *)title subTitles:(NSArray<NSString *> *)subTitles Pages:(NSArray<UIViewController*> *)pages {
    _navTitle = title;
    _subTitles = subTitles;
    _pages = pages;
    [self customUI];
}

- (void)customUI {
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //nav
    [self.view addSubview:self.nav];
    //title
    [self customTitilView];
    //contentView
    [self customContentView];
}

- (void)customTitilView {
    _titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _nav.height, Screen_Width, 48)];
    _titleView.showsVerticalScrollIndicator = NO;
    _titleView.showsHorizontalScrollIndicator = NO;
    
    CGFloat button_w = _subTitles.count >=4 ? Screen_Width / 4.0 : Screen_Width / _subTitles.count;
    CGFloat content_w = _subTitles.count >=4 ? button_w * _subTitles.count : Screen_Width;
    _titleView.contentSize = CGSizeMake(content_w, 48);
    
    NSMutableArray *buttons = [NSMutableArray new];
    for (NSInteger i = 0; i < _subTitles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(button_w * i, 0, button_w, _titleView.height);
        button.backgroundColor = FAFAFA;
        [button setTitle:_subTitles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitleColor:COLOR(@"999999") forState:UIControlStateNormal];
        [button setTitleColor:E94F4F forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_titleView addSubview:button];
        [buttons addObject:button];
    }
    _subTitleButtons = buttons;
    
    for (NSInteger i = 0; i < _subTitles.count - 1; i++) {
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(button_w * (i+1), 4, 0.5, 44)];
        line.backgroundColor = E5E5E5;
        [_titleView addSubview:line];
    }
    UIView *h_line = [[UIView alloc] initWithFrame:CGRectMake(0, 47.5, _titleView.width, 0.5)];
    h_line.backgroundColor = E5E5E5;
    [_titleView addSubview:h_line];
    
    CGFloat mark_w = button_w / 3.0 < 50.0 ? 50.0 : button_w / 3.0;
    
    _markView = [[UIView alloc] initWithFrame:CGRectMake((button_w - mark_w) / 2.0, _titleView.height - 2, mark_w, 2)];
    _markView.layer.masksToBounds = YES;
    _markView.layer.cornerRadius = 1.0f;
    _markView.backgroundColor = E94F4F;
    [_titleView addSubview:_markView];
    
    [self.view addSubview:_titleView];
}

- (void)titleButtonClicked:(UIButton *)button {
    
    for (NSInteger i = 0; i < _subTitleButtons.count; i++) {
        UIButton *titleButton = _subTitleButtons[i];
        if (button == titleButton) {
            titleButton.selected = YES;
            CGRect markFrame = CGRectMake(titleButton.x + (titleButton.width - _markView.width) / 2.0, _markView.y, _markView.width, _markView.height);
            CGPoint offset = CGPointMake(i * _contentView.width, 0);
            [UIView animateWithDuration:0.3 animations:^{
                self->_markView.frame = markFrame;
                self->_contentView.contentOffset = offset;
            }];
        } else {
            titleButton.selected = NO;
        }
    }
}

- (void)customContentView {
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _nav.height + _titleView.height, Screen_Width, Screen_Height - _nav.height - _titleView.height)];
    _contentView.pagingEnabled = YES;
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.showsVerticalScrollIndicator = NO;
    _contentView.delegate = self;
    _contentView.contentSize = CGSizeMake(_contentView.width * _pages.count, _contentView.height);
    
    for (NSInteger i = 0; i < _pages.count; i++) {
        UIViewController *page = _pages[i];
        page.view.frame = CGRectMake(_contentView.width * i, 0, _contentView.width, _contentView.height);
        [_contentView addSubview:page.view];
        
        [self addChildViewController:page];
    }
    [self.view addSubview:_contentView];
}

- (UIView *)nav {
    if (_nav) {
        return _nav;
    }
    _nav = [Func navByTitle:self.navTitle];
    return _nav;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    for (NSInteger i = 0; i < _subTitleButtons.count; i++) {
        UIButton *titleButton = _subTitleButtons[i];
        if (index == i) {
            titleButton.selected = YES;
            CGRect markFrame = CGRectMake(titleButton.x + (titleButton.width - _markView.width) / 2.0, _markView.y, _markView.width, _markView.height);
            [UIView animateWithDuration:0.3 animations:^{
                self->_markView.frame = markFrame;
            }];
        } else {
            titleButton.selected = NO;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    double progress = (double)((double)(scrollView.contentOffset.x) / (double)scrollView.width);
    
    CGFloat button_w = 0;
    if (_subTitleButtons.count > 0) {
        UIButton *button = _subTitleButtons[0];
        button_w = button.width;
    }
    
    CGRect backViewFrame = CGRectMake(progress * button_w, _markView.y, button_w, _markView.height);
    CGRect markFrame = CGRectMake(backViewFrame.origin.x + (button_w - _markView.width) / 2.0 , _markView.y, _markView.width, _markView.height);
    _markView.frame = markFrame;
    
}






@end
